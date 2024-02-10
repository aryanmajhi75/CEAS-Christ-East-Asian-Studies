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
import 'package:flutter/material.dart';

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

  List<Widget> screens = [
    HomeScreen(),
    EducationPage(),
    ScholarshipPage(),
    ExchangesPage(),
    ConferencesPage(),
    InternshipPage(),
    AboutUs(),
    FellowshipPage(),
    FinancialAidPage(),
    UniversityPage(),
    FundAgenciesPage(),
  ];
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

  Widget buildDrawerScaffold(BuildContext context) {
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              widget.header,
              style: Theme.of(context).textTheme.titleSmall,
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
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
