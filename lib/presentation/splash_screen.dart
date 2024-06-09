import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/presentation/bmi_calculator_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    Timer(const Duration(seconds: 3), () => Get.offAll(() => BMICalculatorPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF181A30),
        body: Container(
            child: Center(
                child: Image.asset(
                  "assets/images/icon_rounded.png",
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.5,
                ))));
  }
}
