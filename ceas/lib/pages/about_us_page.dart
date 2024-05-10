import 'package:ceas/dbHelper/links.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String selectedOption = 'All';

  // bool allSelected = false;
  bool ugSelected = false;

  bool pgSelected = false;

  bool phdSelected = false;

  List<Link> items = [
    Link(
        title: "Coursera",
        url:
            "https://www.coursera.org/courses?utm_source=gg&utm_medium=sem&utm_campaign=B2C_India_FTCOF_Branded_ARTE_EXP&utm_content=B2C&campaignid=20590309416&adgroupid=155702724684&device=c&keyword=coursera&matchtype=e&network=g&devicemodel=&adpostion=&creativeid=675426312952&hide_mobile_promo&gclid=CjwKCAiA2pyuBhBKEiwApLaIO9hIlODB3DGFX_M6Vs69vA6L8oCjDciwmk0dUvZRwy0eIMFkov2rBBoCoEYQAvD_BwE"),
    Link(
        title: "Udemy",
        url:
            "https://www.udemy.com/?utm_source=adwords&utm_medium=udemyads&utm_campaign=Generic-Broad_la.EN_cc.INDIA&utm_content=deal4584&utm_term=_._ag_85531604606_._ad_670210024451_._kw_online%20education_._de_c_._dm__._pl__._ti_kwd-10579001_._li_9062015_._pd__._&matchtype=b&gad_source=1&gclid=CjwKCAiA2pyuBhBKEiwApLaIO5I6ptQQ0csn3V7pp-8eWEin7zxbQDj2tAXmPtMnnzeiChXrnKLEbxoC1tgQAvD_BwE"),
    Link(
        title: "Stanford (Online)",
        url: "https://online.stanford.edu/free-courses"),
    Link(
        title: "Simply Learn (Online)",
        url: "https://www.simplilearn.com/skillup-free-online-courses"),
  ];

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
                    "assets/images/aboutus.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Divider(
                  color: Primary().light,
                  thickness: 2,
                ),
                Gap(screenHeight * 0.01),
                // FutureBuilder(
                //     builder: (context, snapshot) {
                //       return CircularProgressIndicator();
                //     },
                // : ListView.builder(itemBuilder: (context, index) {})
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
