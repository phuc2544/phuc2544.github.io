import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/entity/pageviewthongbao.dart';
import 'package:flutter_firebase/features/user_auth/entity/shoppingcart.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/icon_app_bar.dart';

class MyThongbao extends StatefulWidget {
  const MyThongbao({super.key});

  @override
  State<MyThongbao> createState() => _MyThongbaoState();
}

class _MyThongbaoState extends State<MyThongbao> {
  int currentPageView = 0;
  int selectedIndex = 1;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        Navigator.pushReplacementNamed(context, '/shop');
      } else if (selectedIndex == 1) {
        Navigator.pushReplacementNamed(context, '/thongbao');
      } else if (selectedIndex == 2) {
        Navigator.pushReplacementNamed(context, '/toi');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_main,
        title: Text(
          "Thông báo",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconAppBar(
              icon: Icons.shopping_cart_outlined, number: cart.getQuantity()),
          const SizedBox(width: 10),
          IconAppBar(icon: Icons.message_outlined),
          const SizedBox(width: 10)
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 1),
      body: Column(
        children: [
          menuThongBao(),
          Expanded(child: pageView()),
          indicators(listPageviewthongbao.length, currentPageView),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget pageView() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          currentPageView = value;
        });
      },
      children: listPageviewthongbao.map((e) => itemPageView(e)).toList(),
    );
  }

  Widget itemPageView(Pageviewthongbao p) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(p.avtImage),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.title,
                style: TextStyle(fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    130, // Đặt chiều rộng tối đa cho content
                child: Text(
                  p.content,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  maxLines: 1, // Giới hạn số dòng
                  overflow: TextOverflow.ellipsis, // Hiển thị ba chấm
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    );
  }

  Widget indicators(int length, int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: (currentPage == index) ? color_main : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget menuThongBao() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: color_main,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey)),
            child: const Text(
              "Hệ thống",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: color_main)),
            child: Text(
              "Cá nhân",
              style: TextStyle(color: color_main, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Stack IconStack(IconData icon, String number,
      {Color color = Colors.red, String pushNamed = ""}) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, pushNamed),
          icon: Icon(
            icon,
            color: color_main,
          ),
        ),
        Positioned(
          right: 5,
          child: Container(
            width: 25,
            height: 15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
