import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomTabForTabBar extends StatelessWidget {
  const CustomTabForTabBar(
      {super.key, this.assetName, required this.data, this.color});
  final String? assetName;
  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return assetName == null
        ? Tab(
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
                child: Text(data),
              ),
            ),
          )
        : Tab(
            child: Row(
              children: [
                SvgPicture.asset(assetName!),
                const Gap(7),
                Text(data)
              ],
            ),
          );
  }
}
