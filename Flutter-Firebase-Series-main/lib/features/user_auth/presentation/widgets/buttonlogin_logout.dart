import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';

class LogoutButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  LogoutButton(
      {required this.onPressed,
      this.width = 80,
      required this.text,
      this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed, // Sử dụng callback để xử lý sự kiện khi bấm nút
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white), // Viền xám
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Bo góc nhẹ cho nút
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 30), // Padding cho nút
        backgroundColor: color,
      ),
      child: SizedBox(
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: color == Colors.transparent ? Colors.white : color_main,
            ),
          ),
        ),
      ),
    );
  }
}
