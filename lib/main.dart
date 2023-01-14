// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:age_calculator/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: AgeCalculator(),
    );
  }
}

