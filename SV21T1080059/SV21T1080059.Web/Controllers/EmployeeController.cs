using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Web.AppCodes;
using SV21T1080059.Web.Models;
using System.Globalization;

namespace SV21T1080059.Web.Controllers
{
    public class EmployeeController : Controller
    {
        private const int PAGE_SIZE = 12;
        private const string EMPLOYEE_SEARCH_CONDITION = "EmployeeSearchCondition";

        public IActionResult Index()
        {
            PaginationSearchInput? condition = ApplicationContext.GetSessionData<PaginationSearchInput>(EMPLOYEE_SEARCH_CONDITION);
            if (condition == null)
            {
                condition = new PaginationSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = ""
                };
            }
            return View(condition);
        }

        public IActionResult Search(PaginationSearchInput condition)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState); // Trả về lỗi nếu dữ liệu không hợp lệ
            }
            int roxCount;
            var data = CommonDataService.ListOfEmployees(out roxCount, condition.Page, condition.PageSize, condition.SearchValue ?? "");
            EmployeeSearchResult model = new EmployeeSearchResult()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue ?? "",
                RowCount = roxCount,
                Data = data
            };
            ApplicationContext.SetSessionData(EMPLOYEE_SEARCH_CONDITION, condition);

            return View(model);
        }
        public IActionResult Create()
        {
            ViewBag.Title = "Bổ sung nhân viên";
            var data = new Employee()
            {
                EmployeeID = 0,
                IsWorking = true,
                Photo = "nophoto.png"
            };
            return View("Edit", data);
        }

        public IActionResult Edit(int id = 0)
        {
            ViewBag.Title = "Cập nhật thông tin nhân viên";
            var data = CommonDataService.GetEmployee(id);
            if (data == null)
                return RedirectToAction("Index");
            return View(data);
        }
        [HttpPost]
        public IActionResult Save(Employee data, IFormFile? uploadPhoto, string _birthDate)
        {
            ViewBag.Title = data.EmployeeID == 0 ? "Bổ sung nhân viên" : "Cập nhật thông tin nhân viên";
            if (string.IsNullOrWhiteSpace(data.FullName))
            {
                ModelState.AddModelError(nameof(data.FullName), "*");
            }
            if (string.IsNullOrWhiteSpace(data.Email))
            {
                ModelState.AddModelError(nameof(data.Email), "*");
            }
            if (string.IsNullOrWhiteSpace(data.Address))
            {
                data.Address = "";
            }
            if (string.IsNullOrWhiteSpace(data.Phone))
            {
                data.Phone = "";
            }

            DateTime? d = _birthDate.ToDateTime();
            if (d != null)
            {
                if(d.Value.Year < 1753)
                {
                    ModelState.AddModelError("InvalidBirthDate", "Ngày sinh phải từ 1753");
                }
                else
                {
                    data.BirthDate = d.Value;
                }
            }
            else
            {
                ModelState.AddModelError(nameof(data.BirthDate), "*");
            }

            if (!ModelState.IsValid)
            {
                return View("Edit", data);
            }


            if (uploadPhoto != null)
            {
                // Đường dẫn thư mục để lưu file
                //var folder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/themes/dist/img");
                var folder = Path.Combine(ApplicationContext.WebRootPath, "images/employees");

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
                data.Photo = fileName;
            }


            if (data.EmployeeID == 0)
            {
                int id = CommonDataService.AddEmployee(data);
                if (id <= 0)
                {
                    ModelState.AddModelError("InvalidEmail", "Email bị trùng");
                    return View("Edit", data);
                }
            }
            else
            {
                bool result = CommonDataService.UpdateEmployee(data);
                if (!result)
                {
                    ModelState.AddModelError("InvalidEmail", "Email bị trùng");
                    return View("Edit", data);
                }
            }


            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id = 0)
        {
            if (Request.Method == "POST")
            {
                CommonDataService.DeleteEmployee(id);
                return RedirectToAction("Index");
            }
            var data = CommonDataService.GetEmployee(id);
            if (data == null)
                return RedirectToAction("Index");
            return View(data);
        }
    }

}
