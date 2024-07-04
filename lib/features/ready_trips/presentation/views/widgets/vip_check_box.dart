import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class VIPCheckBox extends StatefulWidget {
  const VIPCheckBox({
    super.key,
  });

  @override
  State<VIPCheckBox> createState() => _VIPCheckBoxState();
}

class _VIPCheckBoxState extends State<VIPCheckBox> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(8),
        Checkbox(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            activeColor: kPrimaryColor,
            checkColor: Colors.white,
            hoverColor: Colors.black,
            tristate: true,
            value: isCheck,
            onChanged: (value) {
              isCheck = !isCheck;
              setState(() {});
            }),
        Text(
          'vip ticket ',
          style: AppStyles.styleSourceRegular23(context),
        ),
      ],
    );
  }
}
