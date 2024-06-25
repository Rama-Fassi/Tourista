import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/core/widgets/loading_widget.dart';

import '../../../../../constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_router.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../auth/sign_in_and_up/presentation/manager/sign_out_cubit/sign_out_cubit.dart';

class ShowConfirmationDialog {
  Future<void> showConfirmationDialog(var context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.Confirmation.tr()),
          content: Text(
            LocaleKeys.Are_you_sure_you_want_to_sign_out.tr(),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.cancel.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BlocListener<SignOutCubit, SignOutState>(
              listener: (context, state) {
                if (state is SignOutSuccess) {
                  Hive.box(kTokenBox).delete(kTokenRef);
                  //await GoogleSignIn().signOut();

                  if (kDebugMode) {
                    print(Hive.box(kTokenBox).get(kTokenRef));
                  }
                  GoRouter.of(context).pushReplacement(AppRouter.kSignIN);
                } else if (state is SignOutFailure) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  customSnackBar(context, state.errMessage);
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const LoadingWidget();
                    },
                  );
                }
              },
              child: TextButton(
                child: Text(LocaleKeys.confirm.tr()),
                onPressed: () async {
                  await BlocProvider.of<SignOutCubit>(context).signOut();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
