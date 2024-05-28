import 'dart:developer';

import 'package:ceas/components/loadingContainer.dart';
import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/dbHelper/firebase.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // GeneralInfo generalInfo = GeneralInfo(
  //   description: "",
  //   educationPolicy: "",
  // );

  @override
  void initState() {
    getCountrydetails();
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
                SizedBox(
                  height: screenHeight * 0.4,
                  width: screenWidth,
                  child: FutureBuilder(
                    future: getCountrydetails(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: [
                            Card(
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
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.4),
                                    Gap(screenHeight * 0.007),
                                    LoadingContainer(
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.8),
                                  ],
                                ),
                              ),
                            ),
                            Card(
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
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.4),
                                    Gap(screenHeight * 0.007),
                                    LoadingContainer(
                                        height: screenHeight * 0.03,
                                        width: screenWidth * 0.8),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return ListView(
                        children: [
                          Card(
                            color: Primary().dark,
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
                                  Text(
                                    "About $selectedCountry",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    countryInfo.description,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Primary().dark,
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
                                  Text(
                                    "Education Policy",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    countryInfo.educationPolicy,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Gap(screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
