import 'package:ceas/components/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Column(
          children: [],
        ),
      ),
      backgroundColor: const Color(0xfff1faee),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBar(context, "Home"),
            ],
          ),
        ),
      ),
    );
  }
}
