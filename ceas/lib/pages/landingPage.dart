import "package:ceas/pages/home_screen.dart";
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
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.imageurl,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        widget.heading,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    widget.imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  widget.heading,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.2,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text("Side bar screen"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
