import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/enter_number_column.dart';

class EnterNumberCard extends StatefulWidget {
  const EnterNumberCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<EnterNumberCard> createState() => _EnterNumberCardState();
}

class _EnterNumberCardState extends State<EnterNumberCard> {
  late TextEditingController textEditingController;
  String number = '';
  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      number = textEditingController.text;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 4,
              offset: const Offset(0, -6),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 18, right: 16, bottom: 26),
        child: Row(
          children: [
            EnterNumberColumn(
              textEditingController: textEditingController,
            ),
            const Spacer(),
            CustomButton(
                onTap: () {
                  print('${number}llllllllllllllll');
                  GoRouter.of(context)
                      .push(AppRouter.kVerifyView, extra: number);
                },
                text: LocaleKeys.continueButton.tr(),
                width: widget.screenWidth * .25,
                borderRadius: 8,
                height: 46,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor)
          ],
        ),
      ),
    );
  }
}
