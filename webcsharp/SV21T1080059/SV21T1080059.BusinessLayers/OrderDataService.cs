﻿using SV21T1080059.DataLayers;
using SV21T1080059.DataLayers.SQLServer;
using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.BusinessLayers
{
    public static class OrderDataService
    {
        private static readonly IOrderDAL orderDB;
        private static readonly ISimpleSelectDAL<Statuss> statusDB;
        private static readonly IOrderOfCustomerDAL orderOfCustomerDB;
        /// <summary>
        /// Ctor
        /// </summary>
        static OrderDataService()
        {
            orderDB = new OrderDAL(Configuration.ConnectionString);
            statusDB = new StatusDAL(Configuration.ConnectionString);
            orderOfCustomerDB = new OrderOfCustomerDAL(Configuration.ConnectionString);
        }
        public static List<OrderOfCustomer> ListOrderOfCustomer(int customerID, int status = 0, string searchValue = "")
        {
            return (List<OrderOfCustomer>)orderOfCustomerDB.List(customerID, status, searchValue);
        }
        public static int GetSoldOrderOfCustomer(int productID)
        {
            return orderOfCustomerDB.ListSold(productID);
        }

        /// <summary>
        /// Tìm kiếm và lấy danh sách đơn hàng dưới dạng phân trang
        /// </summary>
        /// <param name="rowCount"></param>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="status"></param>
        /// <param name="fromTime"></param>
        /// <param name="toTime"></param>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        public static List<Order> ListOrders(out int rowCount, int page = 1, int pageSize = 0,
                            int status = 0, DateTime? fromTime = null, DateTime? toTime = null,
                            string searchValue = "")
        {
            rowCount = orderDB.Count(status, fromTime, toTime, searchValue);
            return orderDB.List(page, pageSize, status, fromTime, toTime, searchValue).ToList();
        }

        public static List<Order> ListOrdersofCustomer(out int rowCount, int page = 1, int pageSize = 0,
                            int status = 0, DateTime? fromTime = null, DateTime? toTime = null,
                            string searchValue = "", int customerID = 0)
        {
            rowCount = orderDB.Count(status, fromTime, toTime, searchValue, customerID);
            return orderDB.ListOfCustomer(page, pageSize, status, fromTime, toTime, searchValue, customerID).ToList();
        }
        /// <summary>
        /// Lấy thông tin của 1 đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static Order? GetOrder(int orderID)
        {
            return orderDB.Get(orderID);
        }
        /// <summary>
        /// Khởi tạo 1 đơn hàng mới (tạo đơn hàng mới ở trạng thái Init).
        /// Hàm trả về mã của đơn hàng được tạo mới
        /// </summary>
        /// <param name="employeeID"></param>
        /// <param name="customerID"></param>
        /// <param name="deliveryProvince"></param>
        /// <param name="deliveryAddress"></param>
        /// <param name="details"></param>
        /// <returns></returns>
        public static int InitOrder(int employeeID, int customerID, string customerPhone,
                                    string deliveryProvince, string deliveryAddress,
                                    IEnumerable<OrderDetail> details)
        {
            if (details.Count() == 0)
                return 0;
            Order data = null;
            if (employeeID > 0)
            {
                data = new Order()
                {
                    EmployeeID = employeeID,
                    CustomerID = customerID,
                    CustomerPhone = customerPhone,
                    DeliveryProvince = deliveryProvince,
                    DeliveryAddress = deliveryAddress,
                };
            }
            else
            {
                data = new Order()
                {
                    CustomerID = customerID,
                    CustomerPhone = customerPhone,
                    DeliveryProvince = deliveryProvince,
                    DeliveryAddress = deliveryAddress,
                };
            }
            int orderID = orderDB.Add(data);
            if (orderID > 0)
            {
                foreach (var item in details)
                {
                    orderDB.SaveDetail(orderID, item.ProductID, item.Quantity, item.SalePrice);
                }
                return orderID;
            }
            return 0;
        }
        /// <summary>
        /// Hủy bỏ đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static bool CancelOrder(int orderID)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status != Constants.ORDER_FINISHED)
            {
                data.Status = Constants.ORDER_CANCEL;

                data.FinishedTime = DateTime.Now;
                return orderDB.Update(data);
            }
            return false;
        }
        /// <summary>
        /// Từ chối đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static bool RejectOrder(int orderID)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_INIT || data.Status == Constants.ORDER_ACCEPTED)
            {
                data.Status = Constants.ORDER_REJECTED;
                data.FinishedTime = DateTime.Now;
                return orderDB.Update(data);
            }
            return false;
        }
        /// <summary>
        /// Duyệt chấp nhận đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static bool AcceptOrder(int orderID)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_INIT)
            {
                data.Status = Constants.ORDER_ACCEPTED;
                data.AcceptTime = DateTime.Now;
                return orderDB.Update(data);
            }
            return false;
        }
        /// <summary>
        /// Xác nhận đã chuyển hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="shipperID"></param>
        /// <returns></returns>
        public static bool ShipOrder(int orderID, int shipperID)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_ACCEPTED || data.Status == Constants.ORDER_SHIPPING)
            {
                data.Status = Constants.ORDER_SHIPPING;
                data.ShipperID = shipperID;
                data.ShippedTime = DateTime.Now;
                return orderDB.Update(data);
            }
            return false;
        }
        /// <summary>
        /// Ghi nhận kết thúc quá trình xử lý đơn hàng thành công
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static bool FinishOrder(int orderID)
        {
            Order? data = orderDB.Get(orderID);

            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_SHIPPING)
            {
                data.Status = Constants.ORDER_FINISHED;
                data.FinishedTime = DateTime.Now;
                return orderDB.Update(data);
            }
            return false;
        }
        /// <summary>
        /// Xóa đơn hàng và toàn bộ chi tiết của đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static bool DeleteOrder(int orderID)
        {
            var data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_INIT
            || data.Status == Constants.ORDER_CANCEL
            || data.Status == Constants.ORDER_REJECTED)

                return orderDB.Delete(orderID);
            return false;
        }
        /// <summary>
        /// Lấy danh sách các mặt hàng được bán trong đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <returns></returns>
        public static List<OrderDetail> ListOrderDetails(int orderID)
        {
            return orderDB.ListDetails(orderID).ToList();
        }
        /// <summary>
        /// Lấy thông tin của 1 mặt hàng được bán trong đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="productID"></param>
        /// <returns></returns>
        public static OrderDetail? GetOrderDetail(int orderID, int productID)
        {
            return orderDB.GetDetail(orderID, productID);
        }
        /// <summary>
        /// Lưu thông tin chi tiết của đơn hàng (thêm mặt hàng được bán trong đơn hàng)
        /// theo nguyên tắc:
        /// - Nếu mặt hàng chưa có trong chi tiết đơn hàng thì bổ sung
        /// - Nếu mặt hàng đã có trong chi tiết đơn hàng thì cập nhật lại số lượng và giá bán
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="productID"></param>
        /// <param name="quantity"></param>
        /// <param name="salePrice"></param>
        /// <returns></returns>
        public static bool SaveOrderDetail(int orderID, int productID,
                                int quantity, decimal salePrice)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_INIT || data.Status == Constants.ORDER_ACCEPTED)
            {
                return orderDB.SaveDetail(orderID, productID, quantity, salePrice);
            }
            return false;
        }
        /// <summary>
        /// Xóa một mặt hàng ra khỏi đơn hàng
        /// </summary>
        /// <param name="orderID"></param>
        /// <param name="productID"></param>
        /// <returns></returns>
        public static bool DeleteOrderDetail(int orderID, int productID)
        {
            Order? data = orderDB.Get(orderID);
            if (data == null)
                return false;
            if (data.Status == Constants.ORDER_INIT || data.Status == Constants.ORDER_ACCEPTED)
            {
                return orderDB.DeleteDetail(orderID, productID);
            }
            return false;
        }
        /// <summary>
        /// Lấy toàn bộ dữ liệu của bảng OrderStatus
        /// </summary>
        /// <returns></returns>
        public static List<Statuss> SelectAllStatus()
        {
            return statusDB.List();
        }
        public static bool Update(Order data)
        {
            return orderDB.Update(data);
        }
    }
}
