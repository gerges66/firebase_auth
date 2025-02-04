

import 'package:firebase_auth_test/login_page.dart';
import 'package:firebase_auth_test/pages/home_page.dart';

import 'package:firebase_auth_test/pages/reset_password.dart';
import 'package:firebase_auth_test/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 //   String ?userName;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Pages',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Define routes for each page.
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/reset-password': (context) => ResetPasswordPage(),
     
        '/home': (context) => HomePage(),
      },
      initialRoute: '/',
    );
  }
}
