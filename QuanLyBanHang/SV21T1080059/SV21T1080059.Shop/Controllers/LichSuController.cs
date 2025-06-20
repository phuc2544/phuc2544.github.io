using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.Shop.AppCodes;
using SV21T1080059.Shop.Models;
using System.Globalization;

namespace SV21T1080059.Shop.Controllers
{
    [Authorize]
    public class LichSuController : Controller
    {
        private const int PAGE_SIZE = 15;
        private const string ORDER_SEARCH_CONDITION = "OrderSearchCondition";
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
            var data = OrderDataService.ListOrdersofCustomer(out roxCount, condition.Page, condition.PageSize,
                                                   condition.Status, condition.FromTime, condition.ToTime,
                                                   condition.SearchValue ?? "", int.Parse(User.GetUserData().UserId));
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

        public IActionResult Detail(int id = 0)
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
        public IActionResult Cancel(int id = 0)
        {
            OrderDataService.CancelOrder(id);
            return RedirectToAction("Detail", new { id = id });
        }

        public IActionResult DeleteDetail(int id = 0, int productId = 0)
        {
            OrderDataService.DeleteOrderDetail(id, productId);
            return RedirectToAction("Details", new { id = id });

        }
    }
}
