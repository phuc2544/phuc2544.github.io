using SV21T1080059.DomainModels;

namespace SV21T1080059.Web.Models
{
    public class SupplierSearchResult : PaginationSearchResult
    {
        public required List<Supplier> Data { get; set; }
    }
}
