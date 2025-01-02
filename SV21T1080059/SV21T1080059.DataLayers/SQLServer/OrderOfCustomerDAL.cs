using Dapper;
using SV21T1080059.DomainModels;
using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers.SQLServer
{
    public class OrderOfCustomerDAL : BaseDAL, IOrderOfCustomerDAL
    {
        public OrderOfCustomerDAL(string connectionString) : base(connectionString)
        {
        }

        public IList<OrderOfCustomer> List(int customerID, int status = 0, string searchValue = "")
        {
            List<OrderOfCustomer> list = new List<OrderOfCustomer>();
            if (!string.IsNullOrEmpty(searchValue))
                searchValue = "%" + searchValue + "%";
            using (var connection = OpenConnection())
            {
                var sql = @"SELECT 
                                od.*,
                                p.ProductName,
                                p.Photo,
                                p.Unit,
                                o.OrderTime,
	                            o.AcceptTime,
                                o.ShippedTime,
                                o.FinishedTime,
	                            o.Status,
                                o.CustomerID
                            FROM 
                                Orders AS o
                                JOIN OrderDetails AS od ON o.OrderID = od.OrderID
                                JOIN Products AS p ON od.ProductID = p.ProductID
                            WHERE 
                                o.CustomerID = @CustomerID
                            and (@Status = 0 or o.Status = @Status)
                            and (@SearchValue = N'' or p.ProductName like @SearchValue)";
                var parameters = new
                {
                    CustomerID = customerID,
                    Status = status,
                    SearchValue = searchValue,
                };
                list = connection.Query<OrderOfCustomer>(sql: sql, param: parameters, commandType: System.Data.CommandType.Text).ToList();
                connection.Close();
            }
            return list;
        }

        public int ListSold(int productID)
        {
            int totalSold = 0;
            using (var connection = OpenConnection())
            {
                var sql = @"SELECT SUM(od.Quantity) AS total_sold
                    FROM Orders AS o
                    JOIN OrderDetails AS od ON o.OrderID = od.OrderID
                    JOIN Products AS p ON od.ProductID = p.ProductID
                    WHERE o.status = 1 and od.ProductID = @ProductID
                    GROUP BY od.ProductID;";
                var parameters = new
                {
                    ProductID = productID,
                };

                // ExecuteScalar sẽ trả về giá trị tổng số lượng đã bán
                totalSold = connection.ExecuteScalar<int>(sql, param: parameters, commandType: System.Data.CommandType.Text);
                connection.Close();
            }
            return totalSold;
        }

    }
}
