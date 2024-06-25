import 'package:flutter/material.dart';

import 'widgets/language_view_body.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LanguageViewBody());
  }
}
