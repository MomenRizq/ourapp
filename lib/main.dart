import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ourapp/Pages/bottom_navigationbar_pages.dart';
import 'package:ourapp/Pages/login_page.dart';
import 'Pages/onboarding.dart';
import 'package:ourapp/Pages/sign_up.dart';

String email = "";
String password = "";
String name = " ";

void main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD3Qkg6QBVLhVZ3ltfQlp1oEr51l8g7Pbw",
          appId: "1:266129424550:web:8ca49040f799e3a94ff467",
          messagingSenderId: "266129424550",
          projectId: "ourapp-7208e"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}
