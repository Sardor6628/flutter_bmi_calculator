import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/presentation/bmi_calculator_page.dart';
import 'package:flutter_bmi_calculator/presentation/splash_screen.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}


