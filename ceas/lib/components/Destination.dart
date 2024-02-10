import 'package:flutter/material.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<Destination> destinations = <Destination>[
  Destination(
    'Home',
    Icon(Icons.home_outlined),
    Icon(Icons.home),
  ),
  Destination(
    'Higher Education',
    Icon(Icons.school_outlined),
    Icon(Icons.school),
  ),
  Destination(
    'Fellowship/Scholarship',
    Icon(Icons.cast_for_education_outlined),
    Icon(Icons.cast_for_education_outlined),
  ),
  Destination(
    'Exchanges',
    Icon(Icons.swap_horizontal_circle_outlined),
    Icon(Icons.swap_horizontal_circle),
  ),
  Destination(
    'Conferences',
    Icon(Icons.video_call_outlined),
    Icon(Icons.video_call),
  ),
  Destination(
    'Internships',
    Icon(Icons.work_outline),
    Icon(Icons.work),
  ),
  Destination(
    'About Us',
    Icon(Icons.info_outline),
    Icon(Icons.info),
  ),
  Destination(
    'Fellowship Programs',
    Icon(Icons.groups_3_outlined),
    Icon(Icons.groups_3),
  ),
  Destination(
    'Financial Aid',
    Icon(Icons.monetization_on_outlined),
    Icon(Icons.monetization_on),
  ),
  Destination(
    'University',
    Icon(Icons.auto_stories_outlined),
    Icon(Icons.auto_stories),
  ),
  Destination(
    'Fund Agency',
    Icon(Icons.account_balance_outlined),
    Icon(Icons.account_balance),
  ),
];
