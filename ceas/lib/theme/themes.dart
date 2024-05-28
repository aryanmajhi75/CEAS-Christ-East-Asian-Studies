import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';

//Theme settingsfor dark theme
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Primary().dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Primary().dark,
  ),
  fontFamily: 'Quicksand',
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: Primary().light,
      fontSize: 25,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Primary().light,
      fontSize: 20,
      // overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Primary().light,
      fontSize: 14,
      // overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
    ),
  ),
  navigationDrawerTheme: NavigationDrawerThemeData(
    backgroundColor: Primary().dark,
    indicatorColor: Secondary().omni,
    labelTextStyle: MaterialStatePropertyAll(
      TextStyle(
        color: Primary().light,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    size: 43,
    color: Primary().dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Secondary().omni),
      visualDensity: VisualDensity.comfortable,
      iconColor: MaterialStatePropertyAll(Primary().dark),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Secondary().omni,
    focusColor: Primary().dark,
  ),
);

//Theme settingsfor light theme
ThemeData lightMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Primary().light,
  appBarTheme: AppBarTheme(
    backgroundColor: Primary().light,
  ),
  colorScheme: ColorScheme.dark(
    background: Primary().light,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    //for country names and stuff like that
    titleMedium: TextStyle(
      color: Primary().dark,
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    ),
    //for body headings like "About Country"
    bodyMedium: TextStyle(
      color: Primary().dark,
      fontSize: 20,
      // overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
    ),
    //for content of the headings like for body of "About Country"
    bodySmall: TextStyle(
      color: Primary().dark,
      fontSize: 14,
      // overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
    ),
  ),
  navigationDrawerTheme: NavigationDrawerThemeData(
    backgroundColor: Primary().light,
    indicatorColor: Secondary().omni,
  ),
  iconTheme: IconThemeData(
    size: 43,
    color: Primary().light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Primary().light),
      visualDensity: VisualDensity.comfortable,
      iconColor: MaterialStatePropertyAll(Primary().light),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(Secondary().omni),
      visualDensity: VisualDensity.comfortable,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Secondary().omni,
    sizeConstraints: const BoxConstraints(
      maxHeight: 50,
      maxWidth: 50,
      minHeight: 50,
      minWidth: 50,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
    ),
  ),
);
