import 'dart:async';

import 'package:du_an_cuoi_ky/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:du_an_cuoi_ky/constant.dart';
import 'package:du_an_cuoi_ky/entity/category.dart';
import 'package:du_an_cuoi_ky/entity/product.dart';
import 'package:du_an_cuoi_ky/entity/shoppingcart.dart';
import 'package:du_an_cuoi_ky/home/banner.dart';
import 'package:du_an_cuoi_ky/home/drawer.dart';
import 'package:du_an_cuoi_ky/home/products_gridview.dart';
import 'package:du_an_cuoi_ky/icon/icon_app_bar.dart';
import 'package:du_an_cuoi_ky/utils/api_service.dart';
import 'package:flutter/material.dart';

class MainShopPage extends StatefulWidget {
  const MainShopPage({super.key});

  @override
  State<MainShopPage> createState() => _MainShopPageState();
}

class _MainShopPageState extends State<MainShopPage> {
  final TextEditingController _searchController = TextEditingController();
  final ApiService api = ApiService();
  late Future<List<Product>> listProduct;
  late Future<List<Category>> listCategories;
  String selectedCategory = '';
  String _searchQuery = '';
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  bool isSearching = false; // Biến kiểm tra trạng thái tìm kiếm

  @override
  void initState() {
    super.initState();
    listCategories = api.get_all_categories();
    listProduct = api.get_all_product();
    listProduct.then((products) {
      setState(() {
        allProducts = products;
        filteredProducts = products;
      });
    });
  }

  void updateProductList(String category) {
    setState(() {
      selectedCategory = category;
      listProduct = api.get_products_by_category(category);
    });
  }

  void _filterSearchResults(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        filteredProducts = allProducts;
      } else {
        filteredProducts = allProducts
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _onSearchTap() {
    setState(() {
      isSearching = true; // Kích hoạt trạng thái tìm kiếm
    });
  }

  void _onSearchClose() {
    setState(() {
      isSearching = false; // Đóng trạng thái tìm kiếm
      _searchQuery = ''; // Xóa tìm kiếm
      filteredProducts = allProducts; // Khôi phục danh sách
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(size),
      drawer: FutureBuilder(
        future: listCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!;
            return MyDrawer(
              categories: data,
              selectedCategory: selectedCategory,
              onItemAdded: updateProductList,
            );
          }
        },
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * 0.25,
                child: const BannerPageView(),
              ),
              const SizedBox(height: 5),
              FutureBuilder<List<Product>>(
                future: listProduct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ProductsGridview(
                      products: filteredProducts,
                      onItemAdded: () {
                        setState(() {});
                      },
                    );
                  }
                },
              ),
            ],
          ),
          //Hiển thị danh sách sản phẩm ở ô tìm kiếm
          if (isSearching)
            Positioned(
              top: 0,
              left: 20,
              right: 20,
              child: Material(
                elevation: 4,
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              filteredProducts[index].title,
                              style: TextStyle(fontSize: 14),
                            ),
                            onTap: () {
                              // Chọn sản phẩm từ gợi ý
                              setState(() {
                                _searchController.text =
                                    filteredProducts[index].title;
                                isSearching = false;
                              });
                            },
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 0),
    );
  }

  AppBar myAppBar(Size size) {
    return AppBar(
      backgroundColor: color_main,
      foregroundColor: Colors.white,
      title: SizedBox(
        width: size.width * 8 / 10,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search items...',
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: isSearching
                ? IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: _onSearchClose,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: _filterSearchResults,
          onTap: _onSearchTap,
        ),
      ),
      actions: [
        IconAppBar(
            icon: Icons.shopping_cart_outlined, number: cart.getQuantity()),
        const SizedBox(width: 10),
        IconAppBar(icon: Icons.message_outlined),
        const SizedBox(width: 10),
      ],
    );
  }
}
