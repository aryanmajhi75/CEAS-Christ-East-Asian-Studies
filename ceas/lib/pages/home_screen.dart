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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ListTile(
              style: ListTileStyle.list,
              visualDensity: VisualDensity.comfortable,
              title: Container(
                clipBehavior: Clip.antiAlias,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  "assets/images/china.jpg",
                  fit: BoxFit.cover,
                  cacheHeight: 600,
                ),
              ),
              subtitle: Text(
                "China",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text("About China"),
              subtitle: Text("lorem ipsum...."),
            ),
            ListTile(
              title: Text("Education Policy"),
              subtitle: Text("lorem ipsum...."),
            ),
          ],
        ),
      ),
    );
  }
}
