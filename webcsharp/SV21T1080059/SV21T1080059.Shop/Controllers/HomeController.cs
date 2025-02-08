using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Shop.AppCodes;
using SV21T1080059.Shop.Models;
using System.Diagnostics;

namespace SV21T1080059.Shop.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private const int PAGE_SIZE = 20;
        private const string PRODUCT_SEARCH_CONDITION = "ProductOfCustomerSearchCondition";

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        [AllowAnonymous]
        public IActionResult Index(int id)
        {
            ProductSearchInput? condition = ApplicationContext.GetSessionData<ProductSearchInput>(PRODUCT_SEARCH_CONDITION);
            Category? c = CommonDataService.GetCategory(id);

            if (c == null)
            {
                ViewBag.Title = "Trang chủ";
                condition = new ProductSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = "",
                    CategoryID = 0,
                };
            }
            else
            {
                ViewBag.Title = c.CategoryName;
                condition = new ProductSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = "",
                    CategoryID = id,
                };
            }

            return View(condition);
        }

        [AllowAnonymous]
        public IActionResult Search(ProductSearchInput condition)
        {
            int roxCount;
            var data = ProductDataService.ListProducts(out roxCount, condition.Page, condition.PageSize, condition.SearchValue ?? "", condition.CategoryID,
                                                        condition.SupplierID, condition.MinPrice, condition.MaxPrice);
            ProductSearchResult model = new ProductSearchResult()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue ?? "",
                SupplierID = condition.SupplierID,
                CategoryID = condition.CategoryID,
                MinPrice = condition.MinPrice,
                MaxPrice = condition.MaxPrice,
                RowCount = roxCount,
                Data = data,
            };
            ApplicationContext.SetSessionData(PRODUCT_SEARCH_CONDITION, condition);

            return View(model);
        }
        [AllowAnonymous]
        public IActionResult ProductDetail(int id)
        {
            Product? data = ProductDataService.GetProduct(id);
            return View(data);
        }

        [AllowAnonymous]
        public IActionResult Privacy()
        {
            return View();
        }
        [AllowAnonymous]
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
