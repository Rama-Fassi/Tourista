import 'package:flutter/material.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/verify_sign_up_body.dart';

class VerifySignUpCode extends StatelessWidget {
  const VerifySignUpCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: VerifySignUpBody(),
      ),
    );
  }
}
