import 'dart:async';

import 'package:eshop/screens/clothes_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ClothesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Text(
          "Clothing Store - 206024",
          overflow: TextOverflow.fade,
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 24,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
