import "package:animated_text_kit/animated_text_kit.dart";
import "package:ceas/components/ImageCard.dart";
import "package:ceas/theme/constants.dart";
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
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Welcome",
              textStyle: Theme.of(context).textTheme.titleMedium,
              speed: const Duration(
                milliseconds: 70,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: ListView(
            padding: Modifiers().defPad / 2,
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
                imageurl: "assets/images/seasia.jpg",
                heading: "SE Asia",
                parentHeight: deviceHeight * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
