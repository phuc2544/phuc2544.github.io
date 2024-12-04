import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_toi.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/buttonlogin_logout.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/icon_app_bar.dart';
import 'package:provider/provider.dart';

class MySetting extends StatefulWidget {
  // final String token;
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => MyToi()),
              );
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: color_main,
            )),
        title: const Text(
          "Thiết lập tài khoản",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [IconAppBar(icon: Icons.message), const SizedBox(width: 10)],
      ),
      body: ListView(
        children: [
          Title("Tài khoản"),
          TitleContainer("Địa chỉ"),
          TitleContainer("Tài khoản & Bảo mật"),
          Title("Cài đặt"),
          TitleContainer("Cài đặt Chat"),
          TitleContainer("Cài đặt thông báo"),
          TitleContainer("Cài đặt riêng tư"),
          TitleContainer("Người dùng bị chặn"),
          TitleContainer("Ngôn ngữ / Language"),
          Title("Hỗ trợ"),
          TitleContainer("Trung tâm hỗ trợ"),
          TitleContainer("Tiêu chuẩn cộng đồng"),
          TitleContainer("Điều khoản TinShop"),
          TitleContainer("Hài lòng với TinShop? Hãy đánh giá chúng tôi"),
          TitleContainer("Giới thiệu"),
          TitleContainer("Yêu cầu xoá tài khoản"),
          const SizedBox(height: 8),
          Center(
              child: LogoutButton(
            text: "Đăng xuất",
            width: MediaQuery.of(context).size.width * 0.8,
            onPressed: () async {
              try {
                // Gọi phương thức signOut từ AuthProvider
                await Provider.of<AuthProvider>(context, listen: false)
                    .signOut();

                // Sau khi đăng xuất thành công, chuyển hướng về trang MyToi (hoặc trang khác)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyToi()),
                );
              } catch (e) {
                // Xử lý lỗi nếu đăng xuất thất bại
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Đăng xuất thất bại: $e")),
                );
              }
            },
          )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container Title(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(color: Colors.black26),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
      ),
    );
  }

  Widget TitleContainer(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(10),
      height: 45,
      decoration: BoxDecoration(color: Colors.black87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    );
  }
}
