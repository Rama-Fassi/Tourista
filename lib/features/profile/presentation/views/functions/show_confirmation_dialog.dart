import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/translations/locale_keys.g.dart';

class ShowConfirmationDialog {
  Future<void> showConfirmationDialog(
      {required BuildContext context,
      required String titleText,
      required String contentText,
      required Function()? onConfirmPressed , required bool cancel}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(contentText),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          actions: <Widget>[
         cancel == true ?   TextButton(
              child: Text(LocaleKeys.cancel.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ): const Text(''),
     cancel == true?       TextButton(
              onPressed: onConfirmPressed,
              child: Text(LocaleKeys.confirm.tr()),
            ): TextButton(
              onPressed: onConfirmPressed,
              child: Text(LocaleKeys.ok.tr()),
            ), 
          ],
        );
      },
    );
  }
}
