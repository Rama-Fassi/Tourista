import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Forget Password",
            style: AppStyles.styleInterBold25(context),
          ),
          Spacer(
            flex: 2,
          ),
          SvgPicture.asset(Assets.imagesForegetPassword),
          Spacer(
            flex: 1,
          ),
          Text(
            'don\'t worry you will recieve a verification code ',
            style: AppStyles.styleInterMedium18(context),
          )
        ],
      ),
    );
  }
}
