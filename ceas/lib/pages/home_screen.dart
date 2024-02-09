import 'package:ceas/components/top_bar.dart';
import 'package:ceas/pages/about_us_page.dart';
import 'package:ceas/pages/conferences_page.dart';
import 'package:ceas/pages/education_page.dart';
import 'package:ceas/pages/exchanges_page.dart';
import 'package:ceas/pages/fellowship_page.dart';
import 'package:ceas/pages/financial_aid_page.dart';
import 'package:ceas/pages/fund_agencies_page.dart';
import 'package:ceas/pages/internship_page.dart';
import 'package:ceas/pages/scholarship_page.dart';
import 'package:ceas/pages/university_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DrawerTileItem> screens = [
    DrawerTileItem(
      Icons.home,
      "Home",
      const HomeScreen(),
    ),
    DrawerTileItem(
      Icons.school,
      "Higher Education",
      const EducationPage(),
    ),
    DrawerTileItem(
      Icons.cast_for_education,
      "Fellowship/Scholarship",
      const ScholarshipPage(),
    ),
    DrawerTileItem(
      Icons.compare_arrows,
      "Exchnages",
      const ExchangesPage(),
    ),
    DrawerTileItem(
      Icons.video_call,
      "Conferences",
      const ConferencesPage(),
    ),
    DrawerTileItem(
      Icons.work,
      "Internships",
      const InternshipPage(),
    ),
    DrawerTileItem(
      Icons.info_outlined,
      "About us",
      const AboutUs(),
    ),
    DrawerTileItem(
      Icons.group,
      "Fellowship Programs",
      const FellowshipPage(),
    ),
    DrawerTileItem(
      Icons.monetization_on,
      "Financial Aid",
      const FinancialAidPage(),
    ),
    DrawerTileItem(
      Icons.school,
      "University",
      const UniversityPage(),
    ),
    DrawerTileItem(
      Icons.monetization_on,
      "Fund Agency",
      const FundAgenciesPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  width: double.maxFinite,
                  child: const Text('Drawer Header'),
                ),
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) => drawerItem(
                    context,
                    screens[index],
                  ),
                  itemCount: screens.length,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      backgroundColor: const Color(0xfff1faee),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TopBar(context),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerTileItem {
  final IconData icon;
  final String title;
  final Widget route;

  DrawerTileItem(this.icon, this.title, this.route);
}

Widget drawerItem(BuildContext context, DrawerTileItem item) {
  return ListTile(
    leading: Icon(item.icon),
    title: Text(
      item.title,
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => item.route,
        ),
      );
    },
  );
}
