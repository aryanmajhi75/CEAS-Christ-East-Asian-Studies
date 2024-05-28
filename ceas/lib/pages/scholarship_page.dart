import 'package:ceas/components/shimmerList.dart';
import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/dbHelper/firebase.dart';
import 'package:ceas/dbHelper/weblauncher.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScholarshipPage extends StatefulWidget {
  const ScholarshipPage({super.key});

  @override
  State<ScholarshipPage> createState() => _ScholarshipPageState();
}

class _ScholarshipPageState extends State<ScholarshipPage> {
  String selectedOption = 'All';

  // bool allSelected = false;
  bool ugSelected = false;

  bool pgSelected = false;

  bool phdSelected = false;

  List<Links> links = [];

  loadData() async {
    links = getLinks("education", "");
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
                    "assets/images/scholarships.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Scholarships at $selectedCountry",
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
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  child: FutureBuilder(
                    future: getLinks("scholarships", ""),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: Modifiers().borderRad),
                            elevation: 10,
                            child: Column(
                              children: [
                                Text(
                                  links[index].heading,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Gap(screenHeight * 0.01),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      child: Text(links[index].category),
                                    ),
                                    OutlinedButton.icon(
                                        onPressed: () {
                                          gotoUrl(links[index].url);
                                        },
                                        icon: const Icon(
                                            Icons.arrow_forward_rounded),
                                        label: const Text("Go to site"))
                                  ],
                                )
                              ],
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
