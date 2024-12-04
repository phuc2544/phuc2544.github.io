import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shoppingcart.dart';
import 'package:provider/provider.dart';

class IconAppBar extends StatefulWidget {
  final IconData icon;
  final int number;
  final String targetPage; // Thêm tham số kiểu Widget

  IconAppBar({
    required this.icon,
    this.number = 0,
    this.targetPage = '/shoppingcart', // Thêm tham số targetPage
    Key? key,
  }) : super(key: key);

  @override
  State<IconAppBar> createState() => _IconAppBarState();
}

class _IconAppBarState extends State<IconAppBar> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            if (authProvider.user == null) {
              Navigator.pushNamed(context, '/login');
            } else {
              Navigator.pushNamed(context, widget.targetPage);
            }
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
