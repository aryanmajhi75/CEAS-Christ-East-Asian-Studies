import 'package:flutter/material.dart';

Widget sectionImage(BuildContext context) {
  final deviceHeight = MediaQuery.of(context).size.height;
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 24,
      horizontal: 12,
    ),
    height: deviceHeight * 0.3,
    width: double.maxFinite,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(3, 7),
        ),
      ],
      borderRadius: BorderRadius.circular(12),
      image: const DecorationImage(
        image: AssetImage(
          "assets/images/higherstudies.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: const Text(
      "Education",
      style: TextStyle(
        backgroundColor: Colors.black54,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        letterSpacing: 0.5,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
