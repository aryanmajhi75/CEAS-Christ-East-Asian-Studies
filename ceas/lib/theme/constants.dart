import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class Modifiers {
  EdgeInsetsGeometry defPad = const EdgeInsets.all(20);
  Radius defRad = const Radius.circular(22);
  BorderRadius borderRad = const BorderRadius.all(
    Radius.circular(20),
  );
}

//primary color when in dark mode
class Primary {
  Color dark = const Color(0xFF121212);
  Color light = const Color(0xFFFFFFFF);
}

//secondary color when in dark mode
class Secondary {
  Color omni = const Color(0xFF00ABC9);
}

//tertiary color when in dark mode
class Tertiary {
  Color dark = const Color(0xFFFFFFFF);
  Color light = const Color(0xFF000000);
}

//check if user is logged in or not
class User {
  bool idLoggedin = true;
}

String selectedCountry = "";
