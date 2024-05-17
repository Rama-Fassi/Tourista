import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/functions/verify_app_bar.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.appBarText});
  final String appBarText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: verifyAppBar(context, appBarText: appBarText),
        body: const VerifyViewBody(),
      ),
    );
  }
}
