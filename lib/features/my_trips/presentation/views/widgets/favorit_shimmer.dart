import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class FavoritShimmerLoading extends StatelessWidget {
  const FavoritShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              width: screenWidth,
              height: height * 0.21,
              child: Container(
                color: Colors.white,
              ),
            ),
            const Gap(10),
            Gap(26)
          ],
        ));
  }
}
