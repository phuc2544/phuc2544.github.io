import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/entity/constant.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
// import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter_firebase/global/common/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isSigning = false;
  // final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  @override
  void dispose() {
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
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Login to access',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in with your email and password\nor continue with social media',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Placeholder xử lý "Forgot Password"
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _signIn();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: color_main,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: _isSigning
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _signInWithGoogle();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: color_main,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.signIn(email, password);

      setState(() {
        _isSigning = false;
      });

      if (authProvider.user != null) {
        showToast(message: "Người dùng đã đăng nhập thành công");
        Navigator.pushNamed(context, "/toi");
      }
    } catch (e) {
      setState(() {
        _isSigning = false;
      });
      showToast(message: "Lỗi: $e");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/toi");
      }
    } catch (e) {
      showToast(message: "Đã xảy ra một số lỗi: $e");
    }
  }
}
