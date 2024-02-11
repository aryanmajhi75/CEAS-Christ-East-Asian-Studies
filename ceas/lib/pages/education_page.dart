import 'package:ceas/components/section_image.dart';
import 'package:ceas/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

final Uri _url = Uri.parse("www.google.com");

Future<void> lnchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class _EducationPageState extends State<EducationPage> {
  String selectedOption = 'All';
  // bool allSelected = false;
  bool ugSelected = false;
  bool pgSelected = false;
  bool phdSelected = false;

  List<Item> items = [
    Item(
        title: "Coursera",
        url:
            "https://www.coursera.org/courses?utm_source=gg&utm_medium=sem&utm_campaign=B2C_India_FTCOF_Branded_ARTE_EXP&utm_content=B2C&campaignid=20590309416&adgroupid=155702724684&device=c&keyword=coursera&matchtype=e&network=g&devicemodel=&adpostion=&creativeid=675426312952&hide_mobile_promo&gclid=CjwKCAiA2pyuBhBKEiwApLaIO9hIlODB3DGFX_M6Vs69vA6L8oCjDciwmk0dUvZRwy0eIMFkov2rBBoCoEYQAvD_BwE"),
    Item(
        title: "Udemy",
        url:
            "https://www.udemy.com/?utm_source=adwords&utm_medium=udemyads&utm_campaign=Generic-Broad_la.EN_cc.INDIA&utm_content=deal4584&utm_term=_._ag_85531604606_._ad_670210024451_._kw_online%20education_._de_c_._dm__._pl__._ti_kwd-10579001_._li_9062015_._pd__._&matchtype=b&gad_source=1&gclid=CjwKCAiA2pyuBhBKEiwApLaIO5I6ptQQ0csn3V7pp-8eWEin7zxbQDj2tAXmPtMnnzeiChXrnKLEbxoC1tgQAvD_BwE"),
    Item(
        title: "Stanford (Online)",
        url: "https://online.stanford.edu/free-courses"),
    Item(
        title: "Simply Learn (Online)",
        url: "https://www.simplilearn.com/skillup-free-online-courses"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ListTile(
              style: ListTileStyle.list,
              visualDensity: VisualDensity.comfortable,
              title: Container(
                clipBehavior: Clip.antiAlias,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  "assets/images/higherstudies.jpg",
                  fit: BoxFit.cover,
                  cacheHeight: 600,
                ),
              ),
              subtitle: Text(
                "Higher Education at China",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip.elevated(
                    selected: ugSelected,
                    showCheckmark: true,
                    label: const Text("UG"),
                    onSelected: (value) {
                      setState(() {
                        selectedOption = "UG";
                        ugSelected = !ugSelected;
                        // allSelected = false;
                        pgSelected = false;
                        phdSelected = false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  FilterChip.elevated(
                    selected: pgSelected,
                    showCheckmark: true,
                    label: const Text("PG"),
                    onSelected: (value) {
                      setState(() {
                        selectedOption = "PG";
                        pgSelected = !pgSelected;
                        // allSelected = false;
                        ugSelected = false;
                        phdSelected = false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  FilterChip.elevated(
                    selected: phdSelected,
                    showCheckmark: true,
                    label: const Text("Ph.D"),
                    onSelected: (value) {
                      setState(() {
                        selectedOption = "Ph.D";
                        phdSelected = !phdSelected;
                        // allSelected = false;
                        ugSelected = false;
                        pgSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "$selectedOption Higher Education Opportunities",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              title: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(5),
                    child: contentItem(
                      items[index],
                    ),
                  ),
                  itemCount: items.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String url;

  Item({required this.title, required this.url});
}

Widget contentItem(Item item) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
      ),
      // boxShadow: List.of(elements),
      // color: const Color(0xff051923),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            item.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const IconButton.filled(
          onPressed: lnchUrl,
          icon: Icon(
            Icons.open_in_new,
            color: Colors.white70,
          ),
        )
      ],
    ),
  );
}
