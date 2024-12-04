import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/category.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/entity/product.dart';
import 'package:flutter_firebase/features/user_auth/entity/shoppingcart.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/banner.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/drawer.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/icon_app_bar.dart';
import 'package:flutter_firebase/features/user_auth/utils/api_service.dart';
import 'package:provider/provider.dart';

class MyShop extends StatefulWidget {
  const MyShop({super.key});

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
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

  void addToCart(Product product) {
    setState(() {
      cart.add(
        product,
      ); // Sử dụng phương thức add từ lớp Cart
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
                    // var data = snapshot.data!;
                    return MyGridview(filteredProducts, context);
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
                  color: Colors.black54,
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
            hintText: 'Tìm kiếm sản phẩm...',
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

  GridView MyGridview(List<Product> lst, BuildContext context) {
    return GridView.builder(
      shrinkWrap:
          true, // Giúp GridView không chiếm toàn bộ không gian của ListView
      physics:
          NeverScrollableScrollPhysics(), // Ngừng cuộn của GridView để ListView cuộn mượt mà
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemCount: lst.length,
      itemBuilder: (context, index) {
        return MyItem(lst[index], context);
      },
    );
  }

  Widget MyItem(Product p, BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Center(
                child: ClipRRect(
                  child: Image.network(
                    p.image,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Text(
                p.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${p.price} \$",
                    style: TextStyle(
                      color: color_main,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (authProvider.user == null) {
                        Navigator.pushNamed(context, '/login');
                      } else {
                        addToCart(p); // Thêm sản phẩm vào giỏ hàng
                      }
                    },
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: color_main,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 12,
                  ),
                  Text(
                    " ${p.rating.rate} (${p.rating.count})",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
