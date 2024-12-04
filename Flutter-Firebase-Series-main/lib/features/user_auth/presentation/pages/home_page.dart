import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../global/common/toast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? address;
  int? age;

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        // Kiểm tra và lấy giá trị từ Firestore một cách an toàn
        setState(() {
          username = userDoc.data()?['username'] ?? "No Username";
          address = userDoc.data()?['address'] ?? "No Address";
          age = userDoc.data()?['age'] ?? 0; // Default age là 0
        });
      }
    } catch (e) {
      showToast(message: "Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(username != null ? "Welcome, $username!" : "HomePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (username != null && address != null && age != null) ...[
              Text("Username: $username"),
              Text("Address: $address"),
              Text("Age: $age"),
            ] else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
