import 'package:ceas/pages/landingPage.dart';
import 'package:ceas/theme/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      initialRoute: '/',
      routes: {
        '/landingpage': (context) => const LandingPage(),
      },
      home: const Scaffold(
        body: LandingPage(),
      ),
    );
  }
}
