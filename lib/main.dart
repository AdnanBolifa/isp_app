import 'package:flutter/material.dart';
import 'package:isp_app/constants.dart';
import 'bottom_nav.dart';

// Entry point for the Flutter application. Initializes the app by running the `MyApp` widget.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISP App',
      theme: AppColors.myTheme,
      home: const BottomNav(title: 'ISP TITLE'),
    );
  }
}
