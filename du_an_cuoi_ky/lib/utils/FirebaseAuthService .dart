import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Đăng nhập bằng Email và Mật khẩu
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Trả về thông tin người dùng
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Người dùng không tồn tại.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Sai mật khẩu.');
      } else {
        throw Exception(e.message ?? 'Đăng nhập thất bại.');
      }
    }
  }

  // Đăng ký tài khoản mới
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Trả về thông tin người dùng
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email đã được sử dụng.');
      } else if (e.code == 'weak-password') {
        throw Exception('Mật khẩu quá yếu.');
      } else {
        throw Exception(e.message ?? 'Đăng ký thất bại.');
      }
    }
  }

  // Đăng xuất
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
