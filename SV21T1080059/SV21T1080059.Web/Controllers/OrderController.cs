using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DataLayers.SQLServer;
using SV21T1080059.DomainModels;
using SV21T1080059.Web.AppCodes;
using SV21T1080059.Web.Models;
using System.Globalization;
using System.Text.RegularExpressions;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SV21T1080059.Web.Controllers
{
    public class OrderController : Controller
    {
        private const int PAGE_SIZE = 20;
        private const string ORDER_SEARCH_CONDITION = "OrderSearchCondition";
        private bool IsValidPrice(string price)
        {
            // Biểu thức chính quy để kiểm tra giá  
            string pattern = @"^\d+(\.\d+)?$"; // Giá phải là số với một dấu chấm và một hoặc nhiều chữ số sau dấu chấm  
            return Regex.IsMatch(price, pattern);
        }
        public IActionResult Index()
        {
            var condition = ApplicationContext.GetSessionData<OrderSearchInput>(ORDER_SEARCH_CONDITION);

            if (condition == null)
            {
                var cultureInfo = new CultureInfo("en-GB");
                condition = new OrderSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = "",
                    Status = 0,
                    TimeRange = $"{DateTime.Today.AddDays(-7).ToString("dd/MM/yyyy", cultureInfo)} - {DateTime.Today.ToString("dd/MM/yyyy", cultureInfo)}"
                };
            }
            return View(condition);
        }
        public IActionResult Search(OrderSearchInput condition)
        {
            int roxCount;
            var data = OrderDataService.ListOrders(out roxCount, condition.Page, condition.PageSize,
                                                   condition.Status, condition.FromTime, condition.ToTime,
                                                   condition.SearchValue ?? "");
            OrderSearchResult model = new OrderSearchResult()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                Status = condition.Status,
                TimeRange = condition.TimeRange,
                SearchValue = condition.SearchValue ?? "",
                RowCount = roxCount,
                Data = data
            };
            ApplicationContext.SetSessionData(ORDER_SEARCH_CONDITION, condition);

            return View(model);
        }
        [HttpGet]
        public IActionResult Delete(int id = 0)
        {
            OrderDataService.DeleteOrder(id);
            return RedirectToAction("Index");
        }

        public IActionResult Details(int id = 0)
        {
            var order = OrderDataService.GetOrder(id);
            if (order == null)
            {
                return RedirectToAction("Index");
            }
            var details = OrderDataService.ListOrderDetails(id);
            var model = new OrderDetailModel()
            { 
                Details = details,
                Order = order,
            };
            return View(model);
        }
        public IActionResult DeleteDetail(int id = 0, int productId = 0)
        {
            OrderDataService.DeleteOrderDetail(id, productId);
            return RedirectToAction("Details", new { id = id });

        }

        public IActionResult EditDetail(int id = 0, int productId = 0)
        {
            var data = OrderDataService.GetOrderDetail(id, productId);
            if (data == null)
            {
                return RedirectToAction("Details", new { id = id });
            }
            return PartialView(data);
        }
        [HttpPost]
        public IActionResult UpdateDetail(OrderDetail data, int id = 0)
        {
            if (data.Quantity <= 0)
            {
                ModelState.AddModelError(nameof(data.Quantity), "Vui lòng nhập số lượng > 0");
            }

            if (data.SalePrice <= 0)
            {
                ModelState.AddModelError(nameof(data.SalePrice), "Vui lòng nhập giá bán > 0");
            }

            // Nếu có lỗi, trả lại modal với thông báo lỗi
            if (!ModelState.IsValid)
            {
                return PartialView("EditDetail", data);
            }

            OrderDataService.SaveOrderDetail(id, data.ProductID, data.Quantity, data.SalePrice);

            //return RedirectToAction("Details", new { id = id });
            return Json(new { success = true, redirectUrl = Url.Action("Details", new { id = id }) });
        }

        public IActionResult Shipping(int id = 0, int shipperId = 0)
        {
            OrderDataService.ShipOrder(id, shipperId);
            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Accept(int id = 0)
        {
            OrderDataService.AcceptOrder(id);
            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Finish(int id = 0)
        {
            OrderDataService.FinishOrder(id);
            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Cancel(int id = 0)
        {
            OrderDataService.CancelOrder(id);
            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Reject(int id = 0)
        {
            OrderDataService.RejectOrder(id);
            return RedirectToAction("Details", new { id = id });
        }
        public IActionResult Create()
        {
            return View();
        }
    }
}
