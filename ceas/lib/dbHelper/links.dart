import 'package:ceas/pages/education_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Link {
  final String title;
  final String url;

  Link({required this.title, required this.url});
}

Widget contentItem(Link item) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
      ),
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
        IconButton.filled(
          onPressed: () {
            lnchUrl();
          },
          icon: const Icon(
            Icons.open_in_new,
            color: Colors.white70,
          ),
        )
      ],
    ),
  );
}

Future<void> launchUrlBrowser(String url) async {
  Uri link = Uri.parse(url);

  if (!await launchUrl(
    link,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
