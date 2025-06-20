using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Web.AppCodes;
using SV21T1080059.Web.Models;

namespace SV21T1080059.Web.Controllers
{
    [Authorize(Roles = $"{WebUserRoles.ADMINSTRATOR},{WebUserRoles.EMPLOYEE}")]
    public class CategoryController : Controller
    {
        private const int PAGE_SIZE = 8;
        private const string CATEGORY_SEARCH_CONDITION = "CategorySearchCondition";

        public IActionResult Index()
        {
            PaginationSearchInput? condition = ApplicationContext.GetSessionData<PaginationSearchInput>(CATEGORY_SEARCH_CONDITION);
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
            var data = CommonDataService.ListOfCategories(out roxCount, condition.Page, condition.PageSize, condition.SearchValue ?? "");
            CategorySearchResult model = new CategorySearchResult()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue ?? "",
                RowCount = roxCount,
                Data = data
            };
            ApplicationContext.SetSessionData(CATEGORY_SEARCH_CONDITION, condition);

            return View(model);
        }

        public IActionResult Create()
        {
            ViewBag.Title = "Bổ sung loại hàng";
            var data = new Category() { CategoryID = 0 };
            return View("Edit", data);
        }

        public IActionResult Edit(int id = 0)
        {
            ViewBag.Title = "Cập nhật thông tin loại hàng";
            var data = CommonDataService.GetCategory(id);
            if (data == null)
                return RedirectToAction("Index");
            return View(data);
        }
        [HttpPost]
        public IActionResult Save(Category data) 
        {
            ViewBag.Title = data.CategoryID == 0 ? "Bổ sung loại hàng" : "Cập nhật thông tin loại hàng";
            //Kiểm tra các dữ liệu đầu vào để phát hiện các trường hợp k hợp lệ
            //Kiểm tra nếu thấy dữ liệu k hợp lệ thì lưu trữ thông báo lỗi vào trong ModelState
            if (string.IsNullOrWhiteSpace(data.CategoryName))
            {
                ModelState.AddModelError(nameof(data.CategoryName), "Tên loại hàng không được rỗng");
            }
            if (string.IsNullOrWhiteSpace(data.Description))
            {
                ModelState.AddModelError(nameof(data.Description), "Vui lòng nhập mô tả");
            }

            if (!ModelState.IsValid)
            {
                return View("Edit", data);
            }

            if (data.CategoryID == 0)
            {
                int id = CommonDataService.AddCategory(data);
                if (id <= 0)
                {
                    ModelState.AddModelError(nameof(data.CategoryName), "Loại hàng bị trùng");
                    return View("Edit", data);
                }
            }
            else
            {
                bool result = CommonDataService.UpdateCategory(data);
                if (!result)
                {
                    ModelState.AddModelError(nameof(data.CategoryName), "Loại hàng bị trùng");
                    return View("Edit", data);
                }
            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id = 0)
        {
            if (Request.Method == "POST")
            {
                CommonDataService.DeleteCategory(id);
                return RedirectToAction("Index");
            }
            var data = CommonDataService.GetCategory(id);
            if (data == null)
                return RedirectToAction("Index");

            return View(data);
        }
    }
}
