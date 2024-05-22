import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget(
      {super.key, required this.text, this.image, required this.onTap});
  final String text;
  final String? image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            image == null
                ? Icon(Icons.person_add_alt)
                : SvgPicture.asset(image!),
            Gap(20),
            Text(
              text,
              style: AppStyles.styleInterSemiBold18(context),
            )
          ],
        ),
      ),
    );
  }
}
