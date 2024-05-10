import 'package:ceas/components/Destination.dart';
import 'package:ceas/pages/about_us_page.dart';
import 'package:ceas/pages/conferences_page.dart';
import 'package:ceas/pages/education_page.dart';
import 'package:ceas/pages/exchanges_page.dart';
import 'package:ceas/pages/fellowship_page.dart';
import 'package:ceas/pages/financial_aid_page.dart';
import 'package:ceas/pages/fund_agencies_page.dart';
import 'package:ceas/pages/home_screen.dart';
import 'package:ceas/pages/internship_page.dart';
import 'package:ceas/pages/scholarship_page.dart';
import 'package:ceas/pages/university_page.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class MenuDrawer extends StatefulWidget {
  final String header;
  const MenuDrawer({
    super.key,
    required this.header,
  });

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;
  String currCountry = "";

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildDrawerScaffold(context),
    );
  }

  List<Widget> screens = const [
    HomeScreen(),
    EducationPage(),
    ScholarshipPage(),
    ExchangesPage(),
    ConferencesPage(),
    InternshipPage(),
    FellowshipPage(),
    FinancialAidPage(),
    UniversityPage(),
    FundAgenciesPage(),
    AboutUs(),
  ];

  Widget buildDrawerScaffold(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDrawer();
        },
        child: const Icon(Icons.menu),
      ),
      key: scaffoldKey,
      body: SafeArea(
        child: screens[screenIndex],
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        backgroundColor:
            Theme.of(context).navigationDrawerTheme.backgroundColor,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/landingpage',
                      (route) => false,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
                Gap(screenWidth * 0.1),
                Text(
                  widget.header,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          ...destinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          Padding(
            padding: Modifiers().defPad / 2,
            child: FloatingActionButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: Modifiers().borderRad,
              ),
              onPressed: () {
                scaffoldKey.currentState!.closeEndDrawer();
              },
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
