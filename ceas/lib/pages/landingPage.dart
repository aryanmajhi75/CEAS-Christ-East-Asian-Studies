import "package:ceas/components/ImageCard.dart";
import "package:ceas/pages/home_screen.dart";
import "package:flutter/material.dart";

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

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
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageCard(
                  imageurl: "assets/images/china.jpg",
                  heading: "China",
                  parentHeight: deviceHeight * 0.4,
                ),
                ImageCard(
                  imageurl: "assets/images/indopacific.jpg",
                  heading: "Indo Pacific",
                  parentHeight: deviceHeight * 0.4,
                ),
                ImageCard(
                  imageurl: "assets/images/japan.jpg",
                  heading: "Japan",
                  parentHeight: deviceHeight * 0.4,
                ),
                ImageCard(
                  imageurl: "assets/images/korea.jpg",
                  heading: "Korea",
                  parentHeight: deviceHeight * 0.4,
                ),
                ImageCard(
                  imageurl: "assets/images/southeastasia.jpg",
                  heading: "SE Asia",
                  parentHeight: deviceHeight * 0.4,
                ),
                // SizedBox(
                //   height: deviceHeight * 0.2,
                //   width: deviceWidth * 0.2,
                // ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => HomeScreen(),
                //         ),
                //       );
                //     },
                //     child: Text("Side bar screen"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
