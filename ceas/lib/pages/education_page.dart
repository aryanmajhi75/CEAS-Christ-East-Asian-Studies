import 'dart:developer';

import 'package:ceas/components/shimmerList.dart';
import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/dbHelper/firebase.dart';
import 'package:ceas/dbHelper/weblauncher.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  String selectedOption = "";
  // bool allSelected = false;
  bool ugSelected = false;
  bool pgSelected = false;
  bool phdSelected = false;

  loadData() async {
    getLinks("education", selectedOption);
    // print("printing data from getLinks()");
    // for (var i in links) {
    //   print("\n ${i.url}");
    // }
  }

  @override
  void initState() {
    loadData();
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/images/higherstudies.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Higher Education at $selectedCountry",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Divider(
                  color: Primary().light,
                  thickness: 2,
                ),
                Gap(screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: Modifiers().borderRad,
                        side: BorderSide(
                          width: 1,
                          color: Secondary().omni,
                        ),
                      ),
                      selected: ugSelected,
                      selectedColor: Secondary().omni,
                      showCheckmark: true,
                      visualDensity: VisualDensity.comfortable,
                      label: const Text("UG"),
                      padding: Modifiers().defPad / 2,
                      onSelected: (value) {
                        log(selectedCountry);
                        // if (value) {
                        //   getLinks("education", "UG");
                        // }
                        setState(() {
                          selectedOption = "UG";
                          ugSelected = !ugSelected;
                          pgSelected = false;
                          phdSelected = false;
                        });
                      },
                    ),
                    Gap(screenWidth * 0.01),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: Modifiers().borderRad,
                        side: BorderSide(
                          width: 1,
                          color: Secondary().omni,
                        ),
                      ),
                      selected: pgSelected,
                      selectedColor: Secondary().omni,
                      showCheckmark: true,
                      label: const Text("PG"),
                      onSelected: (value) {
                        // if (value) {
                        //   getLinks("education", "PG");
                        // }
                        setState(() {
                          selectedOption = "PG";
                          pgSelected = !pgSelected;
                          ugSelected = false;
                          phdSelected = false;
                        });
                      },
                    ),
                    Gap(screenWidth * 0.01),
                    FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: Modifiers().borderRad,
                        side: BorderSide(
                          width: 1,
                          color: Secondary().omni,
                        ),
                      ),
                      selected: phdSelected,
                      selectedColor: Secondary().omni,
                      showCheckmark: true,
                      label: const Text("Ph.D"),
                      onSelected: (value) {
                        // if (value) {
                        //   getLinks("education", "PHD");
                        // }
                        setState(() {
                          selectedOption = "Ph.D";
                          phdSelected = !phdSelected;
                          ugSelected = false;
                          pgSelected = false;
                        });
                      },
                    ),
                  ],
                ),
                Gap(screenHeight * 0.01),
                Gap(screenHeight * 0.01),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  child: FutureBuilder(
                    future: getLinks("education", selectedOption),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const ShimmerList();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return ListView.builder(
                        itemCount: links.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card.outlined(
                            color: Tertiary().gray,
                            shape: RoundedRectangleBorder(
                                borderRadius: Modifiers().borderRad),
                            elevation: 10,
                            child: Padding(
                              padding: Modifiers().defPad,
                              child: Column(
                                children: [
                                  Gap(screenHeight * 0.05),
                                  Text(
                                    links[index].heading,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  Gap(screenHeight * 0.05),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.3,
                                        child: Text(links[index].category),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          gotoUrl(links[index].url);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Go to site",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_rounded,
                                              color: Primary().light,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
