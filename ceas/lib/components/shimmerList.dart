import 'package:ceas/components/loadingContainer.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding: Modifiers().defPad / 4,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: Tertiary().gray,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Tertiary().gray,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: Modifiers().defPad / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingContainer(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                ),
                Gap(screenHeight * 0.02),
                Row(
                  children: [
                    LoadingContainer(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.2,
                    ),
                    Gap(screenHeight * 0.1),
                    LoadingContainer(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
