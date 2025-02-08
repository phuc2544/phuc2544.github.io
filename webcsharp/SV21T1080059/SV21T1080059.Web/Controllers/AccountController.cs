using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Web.AppCodes;

namespace SV21T1080059.Web.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(string username, string password)
        {
            ViewBag.Username = username;

            //Kiểm tra thông tin đầu vào
            if (string.IsNullOrEmpty(password) || string.IsNullOrEmpty(username))
            {
                ModelState.AddModelError("Error", "Nhập tên và mật khẩu");
                return View();
            }

            //TODO: Kiểm tra xem username và password (cúa Employee) có đúng không?
            //if(username != "admin")
            //{
            //    ModelState.AddModelError("Error", "Đăng nhập thất bại");
            //}
            var userAccount = UserAccountService.Authorize(UserAccountService.UserTypes.Employee, username, password);

            if (userAccount == null)
            {
                ModelState.AddModelError("Error", "Đăng nhập thất bại");
                return View();
            }

            //Đăng nhập thành công
            //1. Tạo thông tin người dùng
            var userData = new WebUserData()
            {
                UserId = userAccount.UserId,
                UserName = userAccount.UserName,
                DisplayName = userAccount.DisplayName,
                Photo = userAccount.Photo,
                Roles = userAccount.RoleNames.Split(',').ToList(),
            };

            //2. Ghi nhận trạng thái đăng nhập
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userData.CreatePrincipal());

            //3. Quay về trang chủ
            TempData["SuccessMessage"] = "Người dùng đăng nhập thành công!";
            return RedirectToAction("Index", "Home");
        }

        [AllowAnonymous]
        public async Task<IActionResult> Logout()
        {
            HttpContext.Session.Clear();
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login");
        }

        [AllowAnonymous]
        public IActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(string oldPassword, string newPassword, string confirmPassword)
        {
            if (string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirmPassword))
            {
                ModelState.AddModelError("Error", "Vui lòng nhập đầy đủ mật khẩu");
                return View();
            }

            // Kiểm tra độ dài mật khẩu mới
            if (newPassword.Length < 6)
            {
                ModelState.AddModelError("confirmPassword", "Mật khẩu phải có ít nhất 6 ký tự");
                return View();
            }

            // Kiểm tra mật khẩu mới và mật khẩu xác nhận khớp nhau
            if (newPassword != confirmPassword)
            {
                ModelState.AddModelError("confirmPassword", "Mật khẩu mới và mật khẩu xác nhận không khớp");
                return View();
            }

            if (!UserAccountService.CheckOutPassword(UserAccountService.UserTypes.Employee, User.GetUserData().UserName, oldPassword))
            {
                ModelState.AddModelError("oldPassword", "Mật khẩu cũ không đúng");
                return View();
            }

            bool result = UserAccountService.ChangePassword(UserAccountService.UserTypes.Employee, User.GetUserData().UserName, confirmPassword);

            TempData["SuccessMessage"] = "Thay đổi mật khẩu thành công!";
            return RedirectToAction("Index", "Home");
        }

        public IActionResult AccessDenined()
        {
            return View();
        }
    }
}
