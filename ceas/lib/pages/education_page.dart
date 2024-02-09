import 'package:ceas/components/section_image.dart';
import 'package:ceas/components/top_bar.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  String selectedOption = 'All';
  bool allSelected = false;
  bool ugSelected = false;
  bool pgSelected = false;
  bool phdSelected = false;

  List<Item> items = [
    Item(title: "Coursera", url: "www.google.com"),
  ];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip.elevated(
                  selected: allSelected,
                  showCheckmark: true,
                  label: const Text("All"),
                  onSelected: (value) {
                    setState(() {
                      selectedOption = "All";
                      allSelected = !allSelected;
                      ugSelected = false;
                      pgSelected = false;
                      phdSelected = false;
                    });
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                FilterChip.elevated(
                  selected: ugSelected,
                  showCheckmark: true,
                  label: const Text("UG"),
                  onSelected: (value) {
                    setState(() {
                      selectedOption = "UG";
                      ugSelected = !ugSelected;
                      allSelected = false;
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
                      allSelected = false;
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
                      allSelected = false;
                      ugSelected = false;
                      pgSelected = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "$selectedOption Higher Education Opportunities",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                right: 16,
                left: 16,
              ),
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                itemBuilder: (context, index) => contentItem(items[index]),
                itemCount: items.length,
              ),
            )
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
      color: const Color(0xff051923),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.only(
      left: 24,
      top: 8,
      bottom: 8,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Row(
            children: [
              Text(
                "Click to visit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              IconButton.filled(
                onPressed: null,
                icon: Icon(
                  Icons.link,
                  color: Colors.white70,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
