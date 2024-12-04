import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast
          .LENGTH_SHORT, // thời gian hiển thị của toast (short: 2s, long: 3.5s)
      gravity: ToastGravity.BOTTOM, //vị trí hiển thị của toast trên màn hình
      timeInSecForIosWeb:
          2, // thời gian tồn tại của toast trên các nền tảng iOS và Web
      backgroundColor: color_main,
      textColor: Colors.white,
      fontSize: 16.0);
}
