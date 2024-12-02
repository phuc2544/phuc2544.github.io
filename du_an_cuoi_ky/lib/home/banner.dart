import 'dart:async';

import 'package:du_an_cuoi_ky/constant.dart';
import 'package:flutter/material.dart';

class BannerPageView extends StatefulWidget {
  const BannerPageView({super.key});

  @override
  State<BannerPageView> createState() => _BannerPageViewState();
}

class _BannerPageViewState extends State<BannerPageView> {
  List<String> banner = [
    "assets/banner/banner1.jpg",
    "assets/banner/banner2.jpg"
  ];
  int currentBanner = 0;
  // Khai báo Timer
  Timer? _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: currentBanner);
    // Cài đặt Timer để chuyển banner tự động
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentBanner = (currentBanner + 1) % banner.length;
        _pageController.animateToPage(
          currentBanner,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void dispose() {
    // Hủy Timer khi widget bị hủy
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Banner(),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: indicators(banner.length, currentBanner),
        ),
      ],
    );
  }

  PageView Banner() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          currentBanner = value;
        });
      },
      controller: _pageController, // Điều khiển PageView
      children: banner.map((b) => ItemBanner(b)).toList(),
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

  Widget ItemBanner(String imgURL) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 8 / 10,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgURL),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
