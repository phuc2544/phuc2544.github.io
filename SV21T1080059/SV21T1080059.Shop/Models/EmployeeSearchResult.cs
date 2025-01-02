using SV21T1080059.DomainModels;

namespace SV21T1080059.Shop.Models
{
    public class EmployeeSearchResult : PaginationSearchResult
    {
        public required List<Employee> Data { get; set; }
    }
}
