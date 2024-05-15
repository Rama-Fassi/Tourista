import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/enter_number_card.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Forget Password ?",
                style: AppStyles.styleInterBold25(context),
              ),
              SizedBox(
                height: screenWidth * .3,
              ),
              SvgPicture.asset(Assets.imagesForegetPassword),
              SizedBox(
                height: screenWidth * .1,
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  'Don\'t worry you will recieve a verification code ',
                  style: AppStyles.styleInterMedium18(context),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screenWidth * .1,
              ),
              EnterNumberCard(screenWidth: screenWidth)
            ],
          ),
        ),
      ),
    );
  }
}
