import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app2/Screens/authscreen/login.dart';
import 'package:recipe_app2/Screens/authscreen/register.dart';
import 'package:recipe_app2/Screens/home.dart';
import 'package:recipe_app2/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      {
        if (auth.currentUser == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
        }
      }
    });
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 80,
        ),
      ),
    );
  }
}
