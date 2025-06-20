using SV21T1080059.DomainModels;

namespace SV21T1080059.Web.Models
{
    public class CategorySearchResult : PaginationSearchResult
    {
        public required List<Category> Data { get; set; }
    }
}
