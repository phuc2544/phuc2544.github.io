import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget(
      {this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge, // Cắt nội dung vượt quá biên (nếu có)
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: new TextFormField(
        style: TextStyle(color: Colors.white), // Cài đặt màu chữ trắng
        controller: widget.controller, // Controller để quản lý nội dung
        keyboardType: widget.inputType, // Loại bàn phím
        key: widget.fieldKey, // Khóa duy nhất cho widget
        obscureText: widget.isPasswordField == true
            ? _obscureText
            : false, // Ẩn hoặc hiện nội dung
        onSaved: widget.onSaved, // Callback khi form được submit
        validator: widget.validator, // Hàm kiểm tra hợp lệ
        onFieldSubmitted: widget.onFieldSubmitted, // Xử lý khi nhấn Enter
        decoration: InputDecoration(
          border: InputBorder.none, // Không hiển thị đường viền mặc định
          filled: true, // Kích hoạt màu nền
          hintText: widget.hintText, // Văn bản gợi ý
          hintStyle: TextStyle(color: Colors.black45), // Màu văn bản gợi ý
          suffixIcon: GestureDetector(
            onTap: () {
              // Khi nhấn biểu tượng
              setState(() {
                _obscureText = !_obscureText; // Đảo trạng thái ẩn/hiện
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText
                        ? Icons.visibility_off
                        : Icons.visibility, // Biểu tượng con mắt
                    color: _obscureText == false
                        ? color_main
                        : Colors.grey, // Màu biểu tượng
                  )
                : Text(""), // Nếu không phải mật khẩu thì không hiển thị gì
          ),
        ),
      ),
    );
  }
}
