import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shop.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_toi.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final String token;
  final int initialIndex;

  CustomBottomNavigationBar(
      {required this.initialIndex, this.token = "", Key? key})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void onItemTapped(int index) {
    if (_selectedIndex == index)
      return; // Nếu nhấn lại tab hiện tại, không làm gì
    setState(() {
      _selectedIndex = index;
    });

    // Điều hướng theo chỉ mục
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/shop');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/thongbao');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/toi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Thông báo"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tôi"),
      ],
      selectedItemColor: color_main,
      unselectedItemColor: Colors.grey.shade600,
    );
  }
}
