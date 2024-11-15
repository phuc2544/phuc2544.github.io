using SV21T1080059.DomainModels;

namespace SV21T1080059.Web.Models
{
    public class OrderDetailModel
    {
        public Order? Order { get; set; }
        public required List<OrderDetail> Details { get; set; }
    }
}
