﻿using Microsoft.AspNetCore.Authorization;
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
    [Authorize(Roles = $"{WebUserRoles.ADMINSTRATOR},{WebUserRoles.EMPLOYEE}")]
    public class OrderController : Controller
    {
        private const int PAGE_SIZE = 30;
        private const string ORDER_SEARCH_CONDITION = "OrderSearchCondition";

        //Số mặt hàng được hiển thị trên một trang khi tìm kiếm mặt hàng để đưa vào đơn hàng
        private const int PRODUCT_PAGE_SIZE = 5;
        //Tên biến session lưu điều kiện tìm kiếm mặt hàng khi lập đơn hàng
        private const string PRODUCT_SEARCH_CONDITION = "ProductSearchForSale";
        //Tên biến session lưu giỏ hàng
        private const string SHOPPING_CART = "ShoppingCart";

        //private const string EMPLOYEE = "EmployeeCondition";


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
            // Lấy đơn hàng
            var order = OrderDataService.GetOrder(id);

            // Nếu không tìm thấy đơn hàng, chuyển hướng về trang Index
            if (order == null)
            {
                return RedirectToAction("Index");
            }

            // Nếu EmployeeID chưa được thiết lập, cập nhật thông tin
            if (order.EmployeeID == null)
            {
                order.EmployeeID = int.Parse(User.GetUserData().UserId);
                OrderDataService.Update(order);
            }

            // Lấy danh sách chi tiết đơn hàng
            var details = OrderDataService.ListOrderDetails(id);

            // Tạo model và trả về view
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

        public IActionResult Shipping(int id = 0)
        {
            var data = OrderDataService.GetOrder(id);
            if (data != null)
            {
                return PartialView("Shipping", data);
            }

            return RedirectToAction("Details", new { id = id });
        }
        [HttpPost]
        public IActionResult Shipping(int id = 0, int shipperID = 0)
        {
            var order = OrderDataService.GetOrder(id);

            if (shipperID <= 0)
            {
                // Thêm thông báo lỗi nếu thiếu shipperID
                ModelState.AddModelError("Invalid", "Vui lòng chọn người giao hàng.");
                return PartialView("Shipping", order);
            }

            OrderDataService.ShipOrder(id, shipperID);
            return Json(new { success = true, redirectUrl = Url.Action("Details", new { id = id }) });
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
            var condition = ApplicationContext.GetSessionData<ProductSearchInput>(PRODUCT_SEARCH_CONDITION);
            if (condition == null)
            {
                condition = new ProductSearchInput()
                {
                    Page = 1,
                    PageSize = PRODUCT_PAGE_SIZE,
                    SearchValue = ""
                };
            }
            return View(condition);
        }

        public IActionResult SearchProduct(ProductSearchInput condition)
        {
            int rowCount = 0;
            var data = ProductDataService.ListProducts(out rowCount, condition.Page, condition.PageSize, condition.SearchValue ?? "");
            var model = new ProductSearchResult()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue ?? "",
                RowCount = rowCount,
                Data = data
            };
            ApplicationContext.SetSessionData(PRODUCT_SEARCH_CONDITION, condition);
            return View(model);
        }

        private List<CartItem> GetShoppingCart()
        {
            var shoppingCart = ApplicationContext.GetSessionData<List<CartItem>>(SHOPPING_CART);
            if (shoppingCart == null)
            {
                shoppingCart = new List<CartItem>();
                ApplicationContext.SetSessionData(SHOPPING_CART, shoppingCart);
            }
            return shoppingCart;
        }

        public IActionResult AddToCart(CartItem item)
        {
            if (item.SalePrice < 0 || item.Quantity <= 0)
            {
                return Json("Giá bán và số lượng không hợp lệ");
            }

            var shoppingCart = GetShoppingCart();
            var existsProduct = shoppingCart.FirstOrDefault(m => m.ProductID == item.ProductID);
            if (existsProduct == null)
            {
                shoppingCart.Add(item);
            }
            else
            {
                existsProduct.Quantity += item.Quantity;
                existsProduct.SalePrice += item.SalePrice;
            }
            ApplicationContext.SetSessionData(SHOPPING_CART, shoppingCart);
            return Json("");
        }

        public IActionResult RemoveFromCart(int id = 0)
        {
            var shoppingCart = GetShoppingCart();
            int index = shoppingCart.FindIndex(m => m.ProductID == id);
            if (index >= 0)
            {
                shoppingCart.RemoveAt(index);
            }
            ApplicationContext.SetSessionData(SHOPPING_CART, shoppingCart);
            return Json("");
        }

        public IActionResult ClearCart()
        {
            var shoppingCart = GetShoppingCart();
            shoppingCart.Clear();
            ApplicationContext.SetSessionData(SHOPPING_CART, shoppingCart);
            return Json("");
        }

        public IActionResult ShoppingCart()
        {
            return View(GetShoppingCart());
        }

        public IActionResult Init(int customerID = 0, string customerPhone = "", string deliveryProvince = "", string deliveryAddress = "")
        {
            var shoppingCart = GetShoppingCart();
            if (shoppingCart.Count == 0)
            {
                return Json("Giỏ hàng trống. Vui lòng chọn mặt hàng cần bán");
            }

            if (customerID == 0 || string.IsNullOrWhiteSpace(deliveryProvince) || string.IsNullOrWhiteSpace(deliveryAddress) || string.IsNullOrWhiteSpace(customerPhone))
            {
                return Json("Vui lòng nhập đầy đủ thông tin khách hàng và nơi giao hàng");
            }

            try
            {
                int employeeID = (int)Convert.ToUInt32(User.GetUserData().UserId); // TODO: Thay bằng ID của nhân viên đang đăng nhập

                List<OrderDetail> orderDetails = shoppingCart.Select(item => new OrderDetail()
                {
                    ProductID = item.ProductID,
                    Quantity = item.Quantity,
                    SalePrice = item.SalePrice,
                }).ToList();

                int orderID = OrderDataService.InitOrder(employeeID, customerID, customerPhone, deliveryProvince, deliveryAddress, orderDetails);

                // Xóa giỏ hàng sau khi khởi tạo thành công
                ClearCart();

                return Json(orderID); // Trả về ID đơn hàng
            }
            catch (Exception ex)
            {
                // Ghi log lỗi (nếu cần)
                return Json($"Lỗi khi tạo đơn hàng: {ex.Message}");
            }
        }

    }
}