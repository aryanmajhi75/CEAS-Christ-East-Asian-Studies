import 'dart:developer';

import 'package:ceas/pages/menuDrawer.dart';
import 'package:ceas/theme/constants.dart';
import 'package:ceas/theme/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        color: Primary().dark,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Tertiary().gray,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: Modifiers().defPad / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  widget.imageurl,
                  cacheHeight: widget.parentHeight.toInt(),
                ),
              ),
              Divider(
                color: Primary().light,
                thickness: 2,
              ),
              Text(
                widget.heading,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
