using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Shop;
using SV21T1080059.Shop.AppCodes;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SV21T1080059.Shop.Controllers
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
            var userAccount = UserAccountService.Authorize(UserAccountService.UserTypes.Customer, username, password);

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

            if (!UserAccountService.CheckOutPassword(UserAccountService.UserTypes.Customer, User.GetUserData().UserName, oldPassword))
            {
                ModelState.AddModelError("oldPassword", "Mật khẩu cũ không đúng");
                return View();
            }

            bool result = UserAccountService.ChangePassword(UserAccountService.UserTypes.Customer, User.GetUserData().UserName, confirmPassword);

            TempData["SuccessMessage"] = "Thay đổi mật khẩu thành công!";
            return RedirectToAction("Index", "Home");
        }

        public IActionResult AccessDenined()
        {
            return View();
        }


        public IActionResult UpdateUser()
        {
            ViewBag.Title = "Cập nhật hồ sơ";
            var customer = CommonDataService.GetCustomer(int.Parse(User.GetUserData().UserId));

            return View(customer);
        }
        [HttpPost]
        public async Task<IActionResult> UpdateUser(Customer data, IFormFile? uploadPhoto)
        {
            if (string.IsNullOrEmpty(data.ContactName) || string.IsNullOrEmpty(data.Email) || string.IsNullOrEmpty(data.Phone))
            {
                ModelState.AddModelError("Invalid", "Vui lòng không để trống thông tin hồ sơ");
            }
            if (string.IsNullOrWhiteSpace(data.Province))
            {
                ModelState.AddModelError(nameof(data.Province), "Vui lòng chọn Tỉnh/thành");
            }

            if (uploadPhoto != null)
            {
                // Đường dẫn thư mục để lưu file
                var folder = Path.Combine(ApplicationContext.WebRootPath, "images/customer");

                // Tạo thư mục nếu chưa tồn tại
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                // Đặt tên file và đường dẫn
                var fileName = $"{DateTime.Now.Ticks}_{uploadPhoto.FileName}";
                var filePath = Path.Combine(folder, fileName);

                // Lưu file ảnh vào thư mục
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    uploadPhoto.CopyTo(fileStream);
                }

                // Lưu đường dẫn file vào CSDL
                var tam = fileName;
                data.Photo = fileName;
                if (data.Photo == null)
                {
                    data.Photo = tam;
                }
            }

            if (!ModelState.IsValid)
            {
                return View("UpdateUser", data);
            }

            bool result = CommonDataService.UpdateCustomer(data);
            if (!result)
            {
                ModelState.AddModelError(nameof(data.Email), "Email này đã có");
                return View("UpdateUser", data);
            }

            TempData["SuccessMessage"] = "Lưu hồ sơ thành công!";
            return RedirectToAction("Index", "Home");
        }

        [AllowAnonymous]
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> SignUp(string username, string password, string confirmPassword, string phone, string contactName, string customerName, string province)
        {
            // Kiểm tra thông tin đầu vào
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(contactName) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(customerName))
            {
                ModelState.AddModelError("Error", "Vui lòng nhập đầy đủ thông tin");
                return View("SignUp");
            }

            // Kiểm tra độ dài mật khẩu
            if (password.Length < 6)
            {
                ModelState.AddModelError("Password", "Mật khẩu phải có ít nhất 6 ký tự");
                return View("SignUp");
            }

            // Kiểm tra mật khẩu và mật khẩu xác nhận có khớp nhau không
            if (password != confirmPassword)
            {
                ModelState.AddModelError("ConfirmPassword", "Mật khẩu và xác nhận mật khẩu không khớp");
                return View("SignUp");
            }

            // Gọi dịch vụ để đăng ký tài khoản
            try
            {
                int id = UserAccountService.SignUp(UserAccountService.UserTypes.Customer, username, password, contactName, customerName, phone);

                // Kiểm tra kết quả trả về
                if (id <= 0)
                {
                    ModelState.AddModelError("Username", "Tên đăng nhập hoặc thông tin đã tồn tại");
                    return View("SignUp");
                }

                TempData["SuccessMessage"] = "Người dùng đăng ký thành công!";
                return RedirectToAction("Login");
            }
            catch (Exception ex)
            {
                // Ghi log nếu cần
                ModelState.AddModelError("Error", $"Đã xảy ra lỗi: {ex.Message}");
                return View("SignUp");
            }
        }

    }
}
