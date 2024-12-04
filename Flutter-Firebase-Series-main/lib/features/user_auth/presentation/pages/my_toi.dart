// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/entity/shoppingcart.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/setting.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/buttonlogin_logout.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/icon_app_bar.dart';
import 'package:flutter_firebase/global/common/toast.dart';
import 'package:provider/provider.dart';

class MyToi extends StatefulWidget {
  // final String token;
  const MyToi({super.key});

  @override
  State<MyToi> createState() => _MyToiState();
}

class _MyToiState extends State<MyToi> {
  String? username;
  String? address;
  int? age;

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        // Kiểm tra và lấy giá trị từ Firestore một cách an toàn
        setState(() {
          username = userDoc.data()?['username'] ?? "No Username";
          address = userDoc.data()?['address'] ?? "No Address";
          age = userDoc.data()?['age'] ?? 0; // Default age là 0
        });
      }
    } catch (e) {
      showToast(message: "Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContainerBanner(),
          ContainerDonHang(),
          ContainerTienIchMe(),
          ContainerDichVu(),
          ContainerTienIchKhac(),
          ContainerHoTro()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 2),
    );
  }

  Container ContainerHoTro() {
    return ContainerAll(Column(
      children: [
        TitleContainer("Hỗ trợ", ""),
        const SizedBox(height: 10),
        ItemSmall(Icons.help_outline, "Trung tâm trợ giúp"),
        const Divider(),
        ItemSmall(Icons.mark_chat_read_outlined, "Trò chuyện với TinShop")
      ],
    ));
  }

  Container ContainerTienIchKhac() {
    return ContainerAll(Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tiện ích khác",
              style: TextStyle(fontSize: 14),
            ),
            Row(
              children: [
                Text(
                  "Xem tất cả",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildButtonKhac(Icons.favorite_border, "Khách hàng thân thiết",
                text: "Thành viên bạc"),
            BuildButtonKhac(Icons.shopping_bag_outlined, "Mua lại",
                color: Colors.amber)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildButtonKhac(Icons.reset_tv_rounded, "Kênh người sáng tạo"),
            BuildButtonKhac(Icons.savings_outlined, "Số dư Tk Shopee")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildButtonKhac(Icons.card_giftcard, "Săn Thưởng Shopee",
                text: "Giải trí săn xu", color: Colors.blue.shade900),
            BuildButtonKhac(
                Icons.shopping_bag_outlined, "Shopee Tiếp Thị Liên Kết")
          ],
        )
      ],
    ));
  }

  Widget BuildButtonKhac(IconData icon, String title,
      {String text = "", Color? color}) {
    color ??= color_main;
    return Container(
      height: 85,
      width: 235,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (text.isNotEmpty)
                    Text(
                      text,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    )
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    );
  }

  Container ContainerDichVu() {
    return ContainerAll(Column(
      children: [
        TitleContainer("Dịch vụ tài chính", "Xem thêm", isDonMuaOrDichVu: true),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  color: color_main,
                ),
                const Text(
                  "Bảo hiểm của tôi",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Khám phá ngay!",
                  style: TextStyle(fontSize: 14, color: color_main),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        )
      ],
    ));
  }

  Container ContainerTienIchMe() {
    return ContainerAll(ColumnAll(
      buildIcon: [
        Icons.account_balance_wallet,
        Icons.access_time,
        Icons.monetization_on,
        Icons.confirmation_number_outlined
      ],
      bIText: ["Ví ShopeePay", "SPayLater", "Shopee Xu", "Kho Voucher"],
      titleContainer: ["Tiện ích của tôi", ""],
    ));
  }

  Container ContainerDonHang() {
    return ContainerAll(ColumnAll(buildIcon: [
      Icons.assignment_turned_in,
      Icons.inventory,
      Icons.local_shipping,
      Icons.star_border
    ], bIText: [
      "Chờ xác nhận",
      "Chờ lấy hàng",
      "Chờ giao hàng",
      "Đánh giá"
    ], titleContainer: [
      "Đơn mua",
      "Xem lịch sử mua hàng"
    ], isDonMua: true));
  }

  Column ColumnAll(
      {List<IconData> buildIcon = const [],
      List<String> bIText = const [],
      List<String> titleContainer = const [],
      bool isDonMua = false,
      bool isHoTro = false}) {
    return Column(
      children: [
        if (!isHoTro) ...[
          TitleContainer(titleContainer[0], titleContainer[1],
              isDonMuaOrDichVu: isDonMua),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildIcon(buildIcon[0], bIText[0]),
              BuildIcon(buildIcon[1], bIText[1]),
              BuildIcon(buildIcon[2], bIText[2]),
              BuildIcon(buildIcon[3], bIText[3]),
            ],
          )
        ],
        if (isDonMua) ...[
          const Divider(),
          ItemSmall(Icons.phone_android, "Đơn Nạp thẻ và Dịch vụ"),
          const Divider(),
          ItemSmall(Icons.shopify, "Đơn Food"),
        ]
      ],
    );
  }

  Row TitleContainer(String title, String text,
      {bool isDonMuaOrDichVu = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
        Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              width: 5,
            ),
            if (isDonMuaOrDichVu) ...[
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              )
            ]
          ],
        )
      ],
    );
  }

  Row ItemSmall(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
        )
      ],
    );
  }

  Widget BuildIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Container ContainerBanner() {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color_main),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (authProvider.user != null) ...[
                IconAppBar(
                  icon: Icons.settings,
                  targetPage: '/setting',
                )
              ],
              IconAppBar(
                  icon: Icons.shopping_cart_outlined,
                  number: cart.getQuantity()),
              IconAppBar(icon: Icons.message_outlined),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: authProvider.user != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
              ),
              const SizedBox(width: 20),
              if (authProvider.user != null && username != null) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Row(
                      children: [
                        Text(
                          "1 Người theo dõi",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "120 Đang theo dõi",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    LogoutButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      text: "Đăng nhập",
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    LogoutButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/singup');
                        },
                        text: "Đăng ký")
                  ],
                )
              ]
            ],
          )
        ],
      ),
    );
  }

  Container ContainerAll(Column cl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black87),
      child: cl,
    );
  }
}
