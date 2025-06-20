using SV21T1080059.DomainModels;

namespace SV21T1080059.Shop.Models
{
    public class ListStatusOfCustomer
    {
        /// <summary>
        /// Lấy danh sách trạng thái đơn hàng.
        /// </summary>
        /// <returns>Danh sách các trạng thái dưới dạng List<Statuss>.</returns>
        public List<Statuss> GetStatuses()
        {
            return new List<Statuss>
            {
                new Statuss { Status = 1, Description = "Chờ xác nhận" },
                new Statuss { Status = 2, Description = "Chờ giao hàng" },
                new Statuss { Status = 3, Description = "Đang giao hàng" },
                new Statuss { Status = 4, Description = "Hoàn thành" },
                new Statuss { Status = -1, Description = "Đã hủy" },
                new Statuss { Status = -2, Description = "Đã bị từ chối" }
            };
        }
    }
}
