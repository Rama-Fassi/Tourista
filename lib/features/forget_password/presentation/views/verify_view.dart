import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/functions/verify_app_bar.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.appBarText, required this.userId});
  final String appBarText;
  final int userId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: verifyAppBar(context, appBarText: appBarText),
        body: VerifyViewBody(
          userId: userId,
        ),
      ),
    );
  }
}
