import 'package:ceas/components/section_image.dart';
import 'package:ceas/components/top_bar.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              context,
              "China",
            ), //TODO: replace with country name explicitly
            sectionImage(context),
          ],
        ),
      ),
    );
  }
}
