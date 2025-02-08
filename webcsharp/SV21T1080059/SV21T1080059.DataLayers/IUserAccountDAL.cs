using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers
{
    /// <summary>
    /// Định nghĩa các phép xử lý dữ liệu liên quan đến tài khoản người dùng
    /// </summary>
    public interface IUserAccountDAL
    {
        /// <summary>
        /// Xác thực tài khoản đăng nhập của người dùng.
        /// Hàm trả về thông tin tài khoản nếu xác thực thành công,
        /// ngược lại hàm trả về null
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        UserAccount? Authorize(string userName, string password);
        bool ChangePassword(string userName, string password);
        bool CheckOutPassword(string userName, string password);
        int SingUp(string userName, string password, string contactName, string customerName, string phone);
    }
}
