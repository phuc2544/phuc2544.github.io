import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  User? _user;

  User? get user => _user;

  void _setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      User? user = await _firebaseAuthService.signUpWithEmailAndPassword(
          email, password);
      _setUser(user);
    } catch (e) {
      throw Exception("Sign-up failed: $e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      User? user = await _firebaseAuthService.signInWithEmailAndPassword(
          email, password);
      _setUser(user);
    } catch (e) {
      throw Exception("Sign-in failed: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _setUser(null);
    } catch (e) {
      throw Exception("Sign-out failed: $e");
    }
  }

  Future<void> _saveUserToFirestore({
    required String uid,
    required String username,
    required int age,
    required String address,
    required String email,
  }) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    await userCollection.doc(uid).set({
      "username": username,
      "age": age,
      "adress": address,
      "id": uid,
      "email": email,
    });
  }
}
