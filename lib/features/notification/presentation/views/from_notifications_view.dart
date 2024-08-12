import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/notification/presentation/views/widgets/from_notification_view_body.dart';

class FromNotificationsView extends StatelessWidget {
  const FromNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'To Canele The Trip',
            style: AppStyles.styleInterBold20(context)
                .copyWith(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () => GoRouter.of(context).push(AppRouter.kHomeView),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
        ),
        body: FromNotificationsViewBody(),
      ),
    );
  }
}
