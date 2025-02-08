using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DomainModels
{
    public class OrderOfCustomer
    {
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; } = "";
        public string Photo { get; set; } = "";
        public string Unit { get; set; } = "";
        public int Quantity { get; set; } = 0;
        public decimal SalePrice { get; set; } = 0;
        public int TotalQuantitySold { get; set; } = 0;
        public decimal TotalPrice
        {
            get
            {
                return Quantity * SalePrice;
            }
        }
        public DateTime? OrderTime { get; set; }
        public DateTime? AcceptTime { get; set; }
        public DateTime? ShippedTime { get; set; }

        public DateTime? FinishedTime { get; set; }
        public int Status { get; set; }

        public string StatusDescription
        {
            get
            {
                switch (Status)
                {
                    case Constants.ORDER_INIT:
                        return "Chờ xác nhận";
                    case Constants.ORDER_ACCEPTED:
                        return "Chờ giao hàng";
                    case Constants.ORDER_SHIPPING:
                        return "Đang giao hàng";
                    case Constants.ORDER_FINISHED:
                        return "Hoàn thành";
                    case Constants.ORDER_CANCEL:
                        return "Đã huỷ";
                    case Constants.ORDER_REJECTED:
                        return "Đã bị từ chối";
                    default:
                        return "";
                }
            }
        }
    }
}
