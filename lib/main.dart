import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMI(),
      debugShowCheckedModeBanner: false,
    );
  }
}