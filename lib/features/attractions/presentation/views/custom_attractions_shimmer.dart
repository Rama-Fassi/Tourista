import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAttractionsShimmer extends StatelessWidget {
  const CustomAttractionsShimmer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        period: const Duration(milliseconds: 500),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300]!,
            ),
            //   width: screenWidth * .30,
            height: height * 1),
      ),
    );
  }
}
