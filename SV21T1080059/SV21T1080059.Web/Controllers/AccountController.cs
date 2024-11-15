using Microsoft.AspNetCore.Mvc;

namespace SV21T1080059.Web.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Logout()
        {
            return RedirectToAction("Login");
        }
        public IActionResult ChangePassword()
        {
            return View();
        }
    }
}
