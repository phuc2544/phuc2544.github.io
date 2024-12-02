import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:du_an_cuoi_ky/entity/product.dart';
import 'package:du_an_cuoi_ky/entity/category.dart';
import 'package:du_an_cuoi_ky/entity/profile.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10), // Thời gian timeout kết nối
      receiveTimeout: Duration(seconds: 10), // Thời gian timeout nhận phản hồi
    ),
  );

  Future<List<Product>> get_all_product() async {
    var url = 'https://fakestoreapi.com/products';
    var response = await _dio.request(url, options: Options(method: "GET"));
    // await Future.delayed(Duration(seconds: 3)); // để load lâu hơn
    if (response.statusCode == 200) {
      List<dynamic> rs = response.data;
      return rs.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("${response.statusCode} - ${response.statusMessage}");
    }
  }

  Future<List<Product>> get_products_by_category(String categoryName) async {
    var url =
        'https://fakestoreapi.com/products/category/$categoryName'; // Assuming the API supports filtering by category
    var response = await _dio.request(
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
    var url = 'https://fakestoreapi.com/products/categories';
    var response = await _dio.request(url, options: Options(method: "GET"));
    // await Future.delayed(Duration(seconds: 3)); // để load lâu hơn
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return Category.fromJsonList(
          data); // Sử dụng fromJsonList để chuyển đổi JSON
    } else {
      throw Exception("${response.statusCode} - ${response.statusMessage}");
    }
  }

  // Hàm đăng nhập
  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login', // Đường dẫn API
        data: jsonEncode({
          'username': username,
          'password': password,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Giả sử API trả về một JSON chứa token ở trường 'token'
      final token = response.data['accessToken'];
      if (token != null) {
        return token; // Trả về token
      } else {
        throw Exception('Login successful but token not found.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']); // Lỗi từ API
      } else {
        throw Exception('Network error. Please try again later.');
      }
    }
  }

  Future<Profile> get_profile(String token) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/auth/me', // Đường dẫn API
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Thêm token vào header
          },
        ),
      );

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      } else {
        throw Exception("${response.statusCode} - ${response.statusMessage}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception('Network error. Please try again later.');
      }
    }
  }
}
