import 'package:ceas/components/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1faee),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBar(context),
            ],
          ),
        ),
      ),
    );
  }
}
