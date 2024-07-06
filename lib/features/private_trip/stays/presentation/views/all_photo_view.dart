import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class AllPhotosView extends StatelessWidget {
  const AllPhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
