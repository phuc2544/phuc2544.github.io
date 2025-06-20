﻿using SV21T1080059.DataLayers;
using SV21T1080059.DataLayers.SQLServer;
using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.BusinessLayers
{
    public static class ProductDataService
    {
        private static readonly IProductDAL productDB;

        static ProductDataService()
        {
            productDB = new ProductDAL(Configuration.ConnectionString);
        }
        /// <summary>
        /// Tìm kiếm và lấy danh sách mặt hàng không phân trang
        /// </summary>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        //public static List<Product> ListProducts(string searchValue = "")
        //{
        //    return productDB.List(searchValue);
        //}

        /// <summary>
        /// Tìm kiếm và lấy danh sách mặt hàng dưới dạng phân trang
        /// </summary>
        /// <param name="rowCount"></param>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="searchValue"></param>
        /// <param name="categoryID"></param>
        /// <param name="supplierID"></param>
        /// <param name="minPrice"></param>
        /// <param name="maxPrice"></param>
        /// <returns></returns>
        public static List<Product> ListProducts(out int rowCount, int page = 1, int pageSize = 0, string searchValue = "", int categoryID = 0, int supplierID = 0, decimal minPrice = 0, decimal maxPrice = 0)
        {
            rowCount = productDB.Count(searchValue, categoryID, supplierID, minPrice, maxPrice);
            return productDB.List(page, pageSize, searchValue, categoryID, supplierID, minPrice, maxPrice);
        }
        /// <summary>
        /// Lấy thông tin 1 mặt hàng theo mã mặt hàng
        /// </summary>
        /// <param name="productID"></param>
        /// <returns></returns>
        public static Product? GetProduct(int productID)
        {
            return productDB.Get(productID);
        }

        public static int AddProduct(Product data)
        {
            return productDB.Add(data);
        }

        public static bool UpdateProduct(Product data)
        {
            return productDB.Update(data);
        }

        public static bool DeleteProduct(int productID)
        {
            return productDB.Delete(productID);
        }

        public static bool InUsedProduct(int productID)
        {
            return productDB.InUsed(productID);
        }
        //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        public static List<ProductAttribute> ListAttributes(int productID)
        {
            return (List<ProductAttribute>)productDB.ListAttributes(productID);
        }
        public static ProductAttribute? GetAttribute(long attributeID)
        {
            return productDB.GetAttribute(attributeID);
        }
        public static long AddAttribute(ProductAttribute data)
        {
            return productDB.AddAttribute(data);
        }
        public static bool UpdateAttribute(ProductAttribute data)
        {
            return productDB.UpdateAttribute(data);
        }
        public static bool DeleteAttribute(long attributeID)
        {
            return productDB.DeleteAttribute(attributeID);
        }
        /// ////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

        public static List<ProductPhoto> ListPhotos(int productID)
        {
            return (List<ProductPhoto>)productDB.ListPhotos(productID);
        }
        public static ProductPhoto? GetPhoto(long photoID)
        {
            return productDB.GetPhoto(photoID);
        }

        public static long AddPhoto(ProductPhoto data)
        {
            return productDB.AddPhoto(data);
        }

        public static bool UpdatePhoto(ProductPhoto data)
        {
            return productDB.UpdatePhoto(data);
        }

        public static bool DeletePhoto(long photoID)
        {
            return productDB.DeletePhoto(photoID);
        }
    }
}
