using SV21T1080059.DomainModels;

namespace SV21T1080059.Web.Models
{
    public class CustomerSearchResult : PaginationSearchResult
    {
        public required List<Customer> Data { get; set; }
    }
}
