using Microsoft.AspNetCore.Mvc;
using SV21T1080059.BusinessLayers;
using SV21T1080059.DomainModels;
using SV21T1080059.Web.AppCodes;
using SV21T1080059.Web.Models;
using System.Globalization;
using System.Text.RegularExpressions;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SV21T1080059.Web.Controllers
{
    public class ProductController : Controller
    {
        private const int PAGE_SIZE = 30;
        private const string PRODUCT_SEARCH_CONDITION = "ProductSearchCondition";
        public IActionResult Index()
        {
            ProductSearchInput? condition = ApplicationContext.GetSessionData<ProductSearchInput>(PRODUCT_SEARCH_CONDITION);
            if (condition == null)
            {
                condition = new ProductSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = ""
                };
            }
            return View(condition);
        }


        public IActionResult Search(ProductSearchInput condition)
        {
            Console.WriteLine($"CategoryID: {condition.CategoryID}, SupplierID: {condition.SupplierID}");
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState); // Trả về lỗi nếu dữ liệu không hợp lệ
            }
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
        public IActionResult Create()
        {
            ViewBag.Title = "Bổ sung mặt hàng";
            var data = new Product()
            {
                ProductID = 0,
                Photo = "nophoto.png",
                IsSelling = true
            };
            return View("Edit", data);
        }

        public IActionResult Edit(int id = 0)
        {
            ViewBag.Title = "Cập nhật thông tin mặt hàng";
            var data = ProductDataService.GetProduct(id);
            if (data == null)
            {
                return RedirectToAction("Index");
            }

            return View(data);
        }
        [HttpPost]
        public IActionResult Save(Product data, IFormFile? uploadPhoto)
        {
            ViewBag.Title = data.ProductID == 0 ? "Bổ sung mặt hàng" : "Cập nhật thông tin mặt hàng";

            if (string.IsNullOrWhiteSpace(data.ProductName))
            {
                ModelState.AddModelError(nameof(data.ProductName), "Vui lòng nhập tên mặt hàng");
            }


            if (string.IsNullOrWhiteSpace(data.ProductDescription))
            {
                data.ProductDescription = "";
            }


            if (data.CategoryID == 0)
            {
                ModelState.AddModelError(nameof(data.CategoryID), "Vui lòng chọn loại hàng");
            }
            if (data.SupplierID == 0)
            {
                ModelState.AddModelError(nameof(data.SupplierID), "Vui lòng chọn nhà cung cấp");
            }
            if (string.IsNullOrWhiteSpace(data.Unit))
            {
                ModelState.AddModelError(nameof(data.Unit), "Vui lòng nhập đơn vị tính");
            }


            if (data.Price <= 0)
            {
                ModelState.AddModelError(nameof(data.Price), "Vui lòng nhập giá > 0");
            }
            //if (data.Price > 1000000000000)
            //{
            //    ModelState.AddModelError(nameof(data.Price), "Vui lòng nhập giá < 1000.000.000.000");
            //}


            if (uploadPhoto != null)
            {
                // Đường dẫn thư mục để lưu file
                var folder = Path.Combine(ApplicationContext.WebRootPath, "images/products");

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
            if (data.Photo == "nophoto.png" || data.Photo == null)
            {
                ModelState.AddModelError(nameof(data.Photo), "Vui lòng chọn ảnh");
            }

            if (!ModelState.IsValid)
            {
                return View("Edit", data);
            }


            if (data.ProductID == 0)
            {
                int id = ProductDataService.AddProduct(data);

                if (id <= 0)
                {
                    ModelState.AddModelError("InvalidProductName", "Tên mặt hàng bị trùng");
                    return View("Edit", data);
                }

                return RedirectToAction("Edit", new { id = id });
            }
            else
            {
                bool result = ProductDataService.UpdateProduct(data);
                if (!result)
                {
                    ModelState.AddModelError("InvalidProductName", "Tên mặt hàng bị trùng");
                    return View("Edit", data);
                }

            }


            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id = 0)
        {
            if (Request.Method == "POST")
            {
                ProductDataService.DeleteProduct(id);
                return RedirectToAction("Index");
            }
            var data = ProductDataService.GetProduct(id);
            if (data == null)
                return RedirectToAction("Index");
            return View(data);
        }

        public IActionResult Photo(int id = 0, string method = "", int photoId = 0)
        {
            switch (method)
            {
                case "add":
                    ViewBag.Title = "Bổ sung ảnh cho mặt hàng";
                    var data = new ProductPhoto()
                    {
                        ProductID = id,
                        PhotoID = photoId,
                        IsHidden = false,
                        Photo = "nophoto.png"
                    };
                    return View("Photo", data);
                case "edit":
                    ViewBag.Title = "Thay đổi ảnh của mặt hàng";
                    var photo = ProductDataService.GetPhoto(photoId);
                    if (photo == null)
                    {
                        return RedirectToAction("Index");
                    }
                    return View("Photo", photo);
                case "delete":
                    // Xoá ảnh (ảnh trực tiếp, k cần confirm)
                    ProductDataService.DeletePhoto(photoId);
                    return RedirectToAction("Edit", new { id = id });
                default:
                    return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public IActionResult SavePhoto(ProductPhoto data, IFormFile? uploadPhoto)
        {
            ViewBag.Title = data.PhotoID == 0 ? "Bổ sung ảnh cho mặt hàng" : "Thay đổi ảnh của mặt hàng";

            if (string.IsNullOrWhiteSpace(data.Description))
            {
                data.Description = "";
            }


            if (data.DisplayOrder == 0 || data.DisplayOrder < 0)
            {
                ModelState.AddModelError(nameof(data.DisplayOrder), "Vui lòng nhập thứ tự hiển thị > 0");
            }

            if (uploadPhoto != null)
            {
                // Đường dẫn thư mục để lưu file
                var folder = Path.Combine(ApplicationContext.WebRootPath, "images/products/photos");

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
            if (data.Photo == "nophoto.png" || data.Photo == null)
            {
                ModelState.AddModelError(nameof(data.Photo), "Vui lòng chọn ảnh");
            }

            if (!ModelState.IsValid)
            {
                return View("Photo", data);
            }


            if (data.PhotoID == 0)
            {
                long id = ProductDataService.AddPhoto(data);
                if (id <= 0)
                {
                    ModelState.AddModelError("Invalid", "Thứ tự hiển thị bị trùng");
                    return View("Photo", data);
                }
            }
            else
            {
                bool result = ProductDataService.UpdatePhoto(data);
                if (!result)
                {
                    ModelState.AddModelError("Invalid", "Thứ tự hiển thị bị trùng");
                    return View("Photo", data);
                }
            }


            return RedirectToAction("Edit", new { id = data.ProductID });
        }

        public IActionResult Attribute(int id = 0, string method = "", int attributeId = 0)
        {
            switch (method)
            {
                case "add":
                    ViewBag.Title = "Bổ sung thuộc tính cho mặt hàng";
                    var data = new ProductAttribute()
                    {
                        AttributeID = attributeId,
                        ProductID = id,
                    };
                    return View("Attribute", data);
                case "edit":
                    ViewBag.Title = "Thay đổi thuộc tính của mặt hàng";
                    var attribute = ProductDataService.GetAttribute(attributeId);
                    if (attribute == null)
                    {
                        return RedirectToAction("Index");
                    }
                    return View("Attribute", attribute);
                case "delete":
                    // Xoá ảnh (ảnh trực tiếp, k cần confirm)
                    ProductDataService.DeleteAttribute(attributeId);
                    return RedirectToAction("Edit", new { id = id });
                default:
                    return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public IActionResult SaveAttribute(ProductAttribute data)
        {
            ViewBag.Title = data.AttributeID == 0 ? "Bổ sung thuộc tính cho mặt hàng" : "Thay đổi thuộc tính của mặt hàng";

            if (string.IsNullOrWhiteSpace(data.AttributeName))
            {
                ModelState.AddModelError(nameof(data.AttributeName), "Vui lòng nhập tên thuộc tính ");
            }
            if (string.IsNullOrWhiteSpace(data.AttributeValue))
            {
                data.AttributeValue = "";
            }
            if (data.DisplayOrder == 0 || data.DisplayOrder < 0)
            {
                ModelState.AddModelError(nameof(data.DisplayOrder), "Vui lòng nhập thứ tự hiển thị > 0");
            }

            if (!ModelState.IsValid)
            {
                return View("Attribute", data);
            }

            if (data.AttributeID == 0)
            {
                long id = ProductDataService.AddAttribute(data);
                if (id <= 0)
                {
                    ModelState.AddModelError("Invalid", "Tên thuộc tính hoặc Thứ tự hiển thị bị trùng bị trùng");
                    return View("Attribute", data);
                }
            }
            else
            {
                bool result = ProductDataService.UpdateAttribute(data);
                if (!result)
                {
                    ModelState.AddModelError("Invalid", "Tên thuộc tính hoặc Thứ tự hiển thị bị trùng bị trùng");
                    return View("Attribute", data);
                }
            }


            return RedirectToAction("Edit", new { id = data.ProductID });
        }
    }
}
