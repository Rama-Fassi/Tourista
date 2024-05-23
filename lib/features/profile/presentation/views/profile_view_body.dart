import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(const Locale('en'));
            },
            child: const Text('English')),
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(const Locale('ar'));
            },
            child: const Text("العربية")),
      ],
    ));
  }
}
