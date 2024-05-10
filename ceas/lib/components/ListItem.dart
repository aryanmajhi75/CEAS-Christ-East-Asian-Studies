import 'package:ceas/dbHelper/links.dart';
import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';

class LinkListItem extends StatefulWidget {
  String title;
  String url;
  LinkListItem({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<LinkListItem> createState() => _LinkListItemState();
}

class _LinkListItemState extends State<LinkListItem> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        launchUrlBrowser(widget.url);
      },
      child: Card.outlined(
        semanticContainer: true,
        surfaceTintColor: Primary().light,
        color: Primary().dark,
        shape: RoundedRectangleBorder(
          borderRadius: Modifiers().borderRad,
          side: BorderSide(
            color: Primary().light,
            width: 1,
          ),
        ),
        elevation: 10,
        child: Padding(
          padding: Modifiers().defPad / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.7,
                height: screenWidth * 0.3,
                child: Text(
                  widget.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
