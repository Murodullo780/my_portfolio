import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/themes.dart';
import 'package:my_portfolio/my_portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Murodulloh's portfolio",
      theme: MyThemes.lightTheme,
      home: const MyHomePage(),
    );
  }
}
