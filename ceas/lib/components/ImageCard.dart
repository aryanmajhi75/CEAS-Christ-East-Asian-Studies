import 'dart:developer';

import 'package:ceas/pages/menuDrawer.dart';
import 'package:ceas/theme/constants.dart';
import 'package:ceas/theme/themes.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final String imageurl;
  final String heading;
  final double parentHeight;
  const ImageCard({
    super.key,
    required this.imageurl,
    required this.heading,
    required this.parentHeight,
  });

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.heading == "Indo Pacific") {
          selectedCountry = "IndoPacific";
        } else if (widget.heading == "SE Asia") {
          selectedCountry = "SEAsia";
        } else {
          selectedCountry = widget.heading;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuDrawer(
              header: widget.heading,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              widget.imageurl,
              fit: BoxFit.cover,
              cacheHeight: widget.parentHeight.toInt(),
            ),
            Positioned(
              top: widget.parentHeight * 0.25,
              child: Text(
                widget.heading,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
