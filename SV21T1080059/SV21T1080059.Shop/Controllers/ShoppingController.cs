using Microsoft.AspNetCore.Mvc;
using SV21T1080059.Shop.Models;
using SV21T1080059.Shop.AppCodes;
using SV21T1080059.Shop.Models;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using Microsoft.AspNetCore.Authorization;

namespace SV21T1080059.Shop.Controllers
{
    [Authorize]
    public class ShoppingController : Controller
    {
        //Tên biến session lưu giỏ hàng
        private const string SHOPPING_CART = "ShoppingCart";
        private const string PRODUCT_SEARCH_CONDITION = "ProductSearchForSale";

        public IActionResult Index()
        {
            var condition = ApplicationContext.GetSessionData<ProductSearchInput>(PRODUCT_SEARCH_CONDITION);
            if (condition == null)
            {
                condition = new ProductSearchInput()
                {
                    Page = 1,
                    PageSize = 1,
                    SearchValue = ""
                };
            }
            return View(condition);
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
                //existsProduct.SalePrice += item.SalePrice;
            }
            ApplicationContext.SetSessionData(SHOPPING_CART, shoppingCart);

            return Json("");
        }

        public IActionResult AddFromCart(int id = 0)
        {
            var shoppingCart = GetShoppingCart();
            var existsProduct = shoppingCart.FirstOrDefault(m => m.ProductID == id);
            if (existsProduct != null)
            {
                existsProduct.Quantity += 1;
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
            return PartialView("_ShoppingCart", GetShoppingCart());
        }
        public IActionResult Init(int customerID = 0, string customerPhone = "", string deliveryProvince = "", string deliveryAddress = "")
        {
            var shoppingCart = GetShoppingCart();
            if (shoppingCart.Count == 0)
            {
                return Json("Giỏ hàng trống. Vui lòng chọn mặt hàng cần mua");
            }

            if (customerID == 0 || string.IsNullOrWhiteSpace(deliveryProvince) || string.IsNullOrWhiteSpace(deliveryAddress))
            {
                return Json("Vui lòng nhập đầy đủ thông tin khách hàng và nơi giao hàng");
            }

            try
            {
                int employeeID = 1; // TODO: Thay bằng ID của nhân viên đang đăng nhập

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

        public IActionResult GetCartCount()
        {
            var shoppingCart = GetShoppingCart();
            int totalQuantity = shoppingCart?.Sum(x => x.Quantity) ?? 0;
            return Json(totalQuantity);
        }

    }
}
