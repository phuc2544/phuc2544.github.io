import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/AuthProvider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shop.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_shoppingcart.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_thongbao.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/my_toi.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/setting.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBfS_BzSdJKLrr5pFOGWrpBv6d4aqSMpP0",
        appId: "1:897777136897:web:039eb147d1c9aaf9e1d700",
        messagingSenderId: "897777136897",
        projectId: "productstinshop",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tin Shop',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.system,
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/shop': (context) => MyShop(),
        '/toi': (context) => MyToi(),
        '/shoppingcart': (context) => MyShoppingCart(),
        '/setting': (context) => MySetting(),
        '/singup': (context) => SignUpPage(),
        '/thongbao': (context) => MyThongbao(),
      },
      initialRoute: '/shop',
    );
  }
}
