import 'package:ceas/pages/landingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LandingPage(imageurl: "assets/images/china.jpg", heading: ""),
      ),
    );
  }
}
