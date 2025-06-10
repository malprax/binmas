// File: main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/add_profile_screen.dart';
import 'screens/report_screen.dart';

void main() {
  runApp(const BinmasORWApp());
}

class BinmasORWApp extends StatelessWidget {
  const BinmasORWApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Binmas ORW',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}
