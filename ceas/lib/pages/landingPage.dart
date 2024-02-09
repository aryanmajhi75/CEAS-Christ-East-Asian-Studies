import "package:flutter/material.dart";

class LandingPage extends StatefulWidget {
  final String imageurl;
  final String heading;
  const LandingPage({
    super.key,
    required this.imageurl,
    required this.heading,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    widget.imageurl,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(widget.heading),
                SizedBox(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
