import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/category.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shop.dart';

class MyDrawer extends StatefulWidget {
  final void Function(String category) onItemAdded; // Hàm callback để thông báo
  final List<Category> categories;
  final String selectedCategory;

  MyDrawer(
      {required this.onItemAdded,
      required this.categories,
      required this.selectedCategory,
      Key? key})
      : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String selectedCategory = '';

  void ProductsByCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
    widget.onItemAdded(category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width * 2 / 4,
      child: ListView(
        children: [
          LogoShop(context),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              "Danh mục loại hàng",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                children: widget.categories.map((category) {
              bool isSelected = widget.selectedCategory == category.name;
              return ItemCategory(isSelected, category);
            }).toList()),
          ),
          const Divider(indent: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {},
              label: Text(
                "Tôi",
                style: TextStyle(fontSize: 16),
              ),
              icon: Icon(Icons.person_outline),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Padding LogoShop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyShop()));
          },
          child: Text(
            "Tin Shop",
            style: TextStyle(
                fontSize: 24, color: color_main, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Container ItemCategory(bool isSelected, Category category) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.green.shade50
            : Colors.transparent, // Nền màu xanh khi chọn
        border: Border.all(
          color: isSelected
              ? Colors.green
              : Colors.transparent, // Viền màu xanh khi chọn
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        leading: Icon(
          Icons.arrow_right,
          color: color_main,
        ),
        title: Text(
          category.name,
          style: TextStyle(color: isSelected ? Colors.black : Colors.white),
        ),
        onTap: () {
          ProductsByCategory(category.name);
        },
      ),
    );
  }
}
