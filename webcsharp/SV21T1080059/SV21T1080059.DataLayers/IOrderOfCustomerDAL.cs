using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers
{
    public interface IOrderOfCustomerDAL
    {
        /// <summary>
        /// Lấy danh sách đơn hàng của khách hàng có id là customerID
        /// </summary>
        /// <param name="customerID"></param>
        /// <returns></returns>
        IList<OrderOfCustomer> List(int customerID, int status = 0, string searchValue = "");
        int ListSold(int productID);
    }
}
