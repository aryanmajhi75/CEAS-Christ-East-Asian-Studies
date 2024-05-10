import 'package:ceas/dbHelper/links.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FellowshipPage extends StatefulWidget {
  const FellowshipPage({super.key});

  @override
  State<FellowshipPage> createState() => _FellowshipPageState();
}

class _FellowshipPageState extends State<FellowshipPage> {
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
                    "assets/images/fellowship.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Fellowship at $selectedCountry",
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
