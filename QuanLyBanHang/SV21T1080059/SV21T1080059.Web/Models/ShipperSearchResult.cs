using SV21T1080059.DomainModels;

namespace SV21T1080059.Web.Models
{
    public class ShipperSearchResult : PaginationSearchResult
    {
        public required List<Shipper> Data { get; set; }
    }
}
