using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.Shop.AppCodes;
using SV21T1080059.Shop.Models;
using System.Globalization;

namespace SV21T1080059.Shop.Controllers
{
    [Authorize]
    public class OrderTracking : Controller
    {
        private const string ORDEROFCUSTOMER_SEARCH_CONDITION = "OrderOfCustomerSearchCondition";
        public IActionResult Index()
        {
            var condition = ApplicationContext.GetSessionData<OrderOfCustomerSearchInput>(ORDEROFCUSTOMER_SEARCH_CONDITION);

            if (condition == null)
            {
                condition = new OrderOfCustomerSearchInput()
                {
                    SearchValue = "",
                    Status = 0,
                    //TimeRange = $"{DateTime.Today.AddDays(-7).ToString("dd/MM/yyyy", cultureInfo)} - {DateTime.Today.ToString("dd/MM/yyyy", cultureInfo)}"
                };
            }
            return View(condition);
        }
        [HttpGet]
        public IActionResult Search(OrderOfCustomerSearchInput condition)
        {
            // Log đầu vào
            Console.WriteLine($"[DEBUG] Input Status: {condition.Status}, SearchValue: {condition.SearchValue}");
            if (string.IsNullOrEmpty(condition.SearchValue))
            {
                condition.SearchValue = "";  
            }

            // Lấy dữ liệu
            var userId = int.Parse(User.GetUserData().UserId);
            var data = OrderDataService.ListOrderOfCustomer(userId, condition.Status, condition.SearchValue);

            // Log kết quả
            if (data.Count == 0)
            {
                Console.WriteLine("[DEBUG] No matching records found.");
            }
            else
            {
                foreach (var order in data)
                {
                    Console.WriteLine($"[DEBUG] OrderID: {order.OrderID}, Product: {order.ProductName}, Status: {order.Status}");
                }
            }


            // Tạo model kết quả
            OrderOfCustomerSearchResult model = new OrderOfCustomerSearchResult
            {
                Status = condition.Status,
                SearchValue = condition.SearchValue ?? "",
                Data = data
            };

            // Lưu lại điều kiện tìm kiếm vào session
            ApplicationContext.SetSessionData(ORDEROFCUSTOMER_SEARCH_CONDITION, condition);

            // Trả về PartialView
            return View(model);
        }

        public IActionResult Confirm()
        {
            return View();
        }
        public IActionResult Cancel(int id = 0)
        {
            OrderDataService.CancelOrder(id);
            return RedirectToAction("Index", new { id = id });
        }

        
    }
}
