import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomTabForTabBar extends StatelessWidget {
  const CustomTabForTabBar({
    super.key, required this.assetName, required this.data,
  });
  final String assetName;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          SvgPicture.asset(assetName),
          const Gap(7),
           Text(data)
        ],
      ),
    );
  }
}
