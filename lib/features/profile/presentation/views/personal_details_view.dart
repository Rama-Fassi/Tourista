import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/profile/data/models/user_info_model/user_info_model.dart';

import 'widgets/personal_details_view_body.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key, required this.userInfoModel});
  final UserInfoModel userInfoModel;

  @override
  Widget build(BuildContext context) {
    print('${userInfoModel.user!.name}');
    double scereenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 5,
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        backgroundColor: kPrimaryColor,
        title: Text(
          LocaleKeys.personal_details.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PersonalDetailsViewBody(
            scereenWidth: scereenWidth,
            userInfoModel: userInfoModel,
          ),
        ),
      ),
    );
  }
}
