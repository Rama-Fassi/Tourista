import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utlis/styles.dart';

class IconWithTextRow extends StatelessWidget {
  const IconWithTextRow({
    super.key,
    required this.assetName,
    required this.data, this.color,
  });
  final String assetName;
  final String data;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          assetName,
          width: 18,
          height: 18,
        ),
        const Gap(13),
        Text(
          data,
          style: AppStyles.styleQuickBold16(context).copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
