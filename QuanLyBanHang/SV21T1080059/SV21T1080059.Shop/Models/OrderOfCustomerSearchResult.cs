using SV21T1080059.DomainModels;

namespace SV21T1080059.Shop.Models
{
    public class OrderOfCustomerSearchResult
    {
        public int Status { get; set; } = 0;
        public string SearchValue { get; set; } = "";
        public List<OrderOfCustomer> Data { get; set; } = new List<OrderOfCustomer>();
    }
}
