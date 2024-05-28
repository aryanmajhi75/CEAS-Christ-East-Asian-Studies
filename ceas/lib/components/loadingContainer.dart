import 'package:ceas/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  final double height;
  final double width;
  const LoadingContainer({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Container(
          color: Tertiary().dark,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
