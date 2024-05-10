import 'dart:developer';

import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Modifiers().defPad,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: screenHeight * 0.5,
                width: screenWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/${selectedCountry.toLowerCase()}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                selectedCountry,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Divider(
                color: Primary().light,
                thickness: 2,
              ),
              Gap(screenHeight * 0.03),
              Text(
                "About $selectedCountry",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(screenHeight * 0.01),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Gap(screenHeight * 0.03),
              Text(
                "Education Policy",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(screenHeight * 0.01),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      )
          // ListView(
          //   padding: Modifiers().defPad / 4,
          //   children: [
          //     ListTile(
          //       style: ListTileStyle.list,
          //       visualDensity: VisualDensity.comfortable,
          //       title: Container(
          //         clipBehavior: Clip.antiAlias,
          //         height: screenHeight * 0.5,
          //         width: screenWidth,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.rectangle,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: Image.asset(
          //           "assets/images/${selectedCountry.toLowerCase()}.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       subtitle: Text(
          //         selectedCountry,
          //         style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       title: Text("About $selectedCountry"),
          //       subtitle: Text("lorem ipsum...."),
          //     ),
          //     ListTile(
          //       title: const Text("Education Policy"),
          //       subtitle: Text("lorem ipsum...."),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
