import 'package:dio/dio.dart';
import 'package:flutter_firebase/features/user_auth/entity/category.dart';
import 'package:flutter_firebase/features/user_auth/entity/product.dart';

class ApiService {
  Future<List<Product>> get_all_product() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';
    var response = await dio.request(url, options: Options(method: "GET"));
    // await Future.delayed(Duration(seconds: 3)); // để load lâu hơn
    if (response.statusCode == 200) {
      List<dynamic> rs = response.data;
      return rs.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("${response.statusCode} - ${response.statusMessage}");
    }
  }

  Future<List<Product>> get_products_by_category(String categoryName) async {
    var dio = Dio();
    var url =
        'https://fakestoreapi.com/products/category/$categoryName'; // Assuming the API supports filtering by category
    var response = await dio.request(
      url,
      options: Options(method: "GET"),
    );

    if (response.statusCode == 200) {
      List<dynamic> rs = response.data;
      return rs.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("${response.statusCode} - ${response.statusMessage}");
    }
  }

  Future<List<Category>> get_all_categories() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products/categories';
    var response = await dio.request(url, options: Options(method: "GET"));
    // await Future.delayed(Duration(seconds: 3)); // để load lâu hơn
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return Category.fromJsonList(
          data); // Sử dụng fromJsonList để chuyển đổi JSON
    } else {
      throw Exception("${response.statusCode} - ${response.statusMessage}");
    }
  }
}
