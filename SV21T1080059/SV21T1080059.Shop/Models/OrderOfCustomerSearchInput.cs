using SV21T1080059.Shop.AppCodes;

namespace SV21T1080059.Shop.Models
{
    public class OrderOfCustomerSearchInput
    {
        public string SearchValue { get; set; } = "";
        /// <summary>
        /// Trạng thái của đơn hàng cần tìm
        /// </summary>
        public int Status { get; set; } = 0;
    }
}
