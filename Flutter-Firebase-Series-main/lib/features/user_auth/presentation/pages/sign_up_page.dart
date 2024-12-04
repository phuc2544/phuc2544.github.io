import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
// import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter_firebase/global/common/toast.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final FirebaseAuthService _authService = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: color_main, // Màu sắc của nút back
          ),
        ),
        title: Text("SignUp"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _signUp();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: color_main,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: isSigningUp
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: color_main, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    int age = 21; // Ví dụ tuổi mặc định
    String address = ""; // Ví dụ địa chỉ mặc định
    String phone = "";

    try {
      // Sử dụng AuthProvider để đăng ký
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.signUp(email, password);

      // Lấy thông tin người dùng hiện tại
      User? user = authProvider.user;

      if (user != null) {
        // Lưu thêm thông tin người dùng vào Firestore
        await _saveUserToFirestore(
          uid: user.uid,
          username: username,
          age: age,
          address: address,
          email: email,
          phone: phone,
        );

        showToast(message: "Người dùng được tạo thành công");
        Navigator.pushNamed(context, "/login"); // Chuyển tới HomePage
      } else {
        showToast(message: "Đã xảy ra một số lỗi");
      }
    } catch (e) {
      showToast(message: "Lỗi: $e");
    } finally {
      setState(() {
        isSigningUp = false;
      });
    }
  }

  Future<void> _saveUserToFirestore({
    required String uid,
    required String username,
    required int age,
    required String address,
    required String email,
    required String phone,
  }) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    await userCollection.doc(uid).set({
      "username": username,
      "age": age,
      "adress": address,
      "id": uid,
      "email": email,
      "phone": phone,
    });
  }
}
