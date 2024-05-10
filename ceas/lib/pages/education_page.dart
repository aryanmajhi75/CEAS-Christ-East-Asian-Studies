import 'dart:developer';

import 'package:ceas/components/ListItem.dart';
import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/dbHelper/firebase.dart';
import 'package:ceas/dbHelper/links.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

Future<void> gotoUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

class _EducationPageState extends State<EducationPage> {
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

  // List<Link> links = [
  //   Link(
  //       title: "Coursera",
  //       url:
  //           "https://www.coursera.org/courses?utm_source=gg&utm_medium=sem&utm_campaign=B2C_India_FTCOF_Branded_ARTE_EXP&utm_content=B2C&campaignid=20590309416&adgroupid=155702724684&device=c&keyword=coursera&matchtype=e&network=g&devicemodel=&adpostion=&creativeid=675426312952&hide_mobile_promo&gclid=CjwKCAiA2pyuBhBKEiwApLaIO9hIlODB3DGFX_M6Vs69vA6L8oCjDciwmk0dUvZRwy0eIMFkov2rBBoCoEYQAvD_BwE"),
  //   Link(
  //       title: "Udemy",
  //       url:
  //           "https://www.udemy.com/?utm_source=adwords&utm_medium=udemyads&utm_campaign=Generic-Broad_la.EN_cc.INDIA&utm_content=deal4584&utm_term=_._ag_85531604606_._ad_670210024451_._kw_online%20education_._de_c_._dm__._pl__._ti_kwd-10579001_._li_9062015_._pd__._&matchtype=b&gad_source=1&gclid=CjwKCAiA2pyuBhBKEiwApLaIO5I6ptQQ0csn3V7pp-8eWEin7zxbQDj2tAXmPtMnnzeiChXrnKLEbxoC1tgQAvD_BwE"),
  //   Link(
  //       title: "Stanford (Online)",
  //       url: "https://online.stanford.edu/free-courses"),
  //   Link(
  //       title: "Simply Learn (Online)",
  //       url: "https://www.simplilearn.com/skillup-free-online-courses"),
  // ];

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
                        if (value) {
                          getLinks("education", "UG");
                        }
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
                        if (value) {
                          getLinks("education", "PG");
                        }
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
                        if (value) {
                          getLinks("education", "PHD");
                        }
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
                Expanded(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: FutureBuilder(
                      future: getLinks("education", ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // show a loading spinner while waiting
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error: ${snapshot.error}'); // show an error message if there's an error
                        }
                        if (snapshot.connectionState == snapshot.hasData) {
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
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
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
                //           SizedBox(
                //             height: screenHeight * 0.5,
                //             width: screenWidth,
                //             child: FutureBuilder(future: , builder: (context, snapshot) {
                //               if (snapshot.connectionState == ConnectionState.none &&
                //     snapshot.hasData == null) {
                //   return Container();
                // }
                //             },),
                // ListView(
                //   children: [
                //     LinkListItem(
                //       title: "Youth of Excellence Scheme of China Program",
                //       url: "https://intl.csu.edu.cn/info/1143/2635.htm",
                //     ),
                //     LinkListItem(
                //       title: "Chinese Government Scholarship",
                //       url:
                //           "https://admission-is.bnu.edu.cn/english/international/chineseovernment/typebchinese/index.html",
                //     ),
                //   ],
                // ),
                // ),
                //For the listview to be implemented
                //https://bootcamp.uxdesign.cc/creating-a-custom-product-list-view-in-flutter-a-step-by-step-guide-c471761245d5
              ],
            ),
          ),
        ),
      ),
    );
  }
}
