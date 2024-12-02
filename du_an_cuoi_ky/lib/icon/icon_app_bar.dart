import 'package:du_an_cuoi_ky/shopping_cart/my_shoppingcart.dart';
import 'package:flutter/material.dart';

class IconAppBar extends StatefulWidget {
  final IconData icon;
  final int number;
  final Widget targetPage; // Thêm tham số kiểu Widget

  IconAppBar({
    required this.icon,
    this.number = 0,
    this.targetPage = const MyShoppingCart(), // Thêm tham số targetPage
    Key? key,
  }) : super(key: key);

  @override
  State<IconAppBar> createState() => _IconAppBarState();
}

class _IconAppBarState extends State<IconAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    widget.targetPage, // Sử dụng targetPage để điều hướng
              ),
            );
          },
          icon: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
        widget.number != 0
            ? Positioned(
                right: 5,
                child: Container(
                  width: 25,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      widget.number >= 99
                          ? "${widget.number}+"
                          : "${widget.number}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
