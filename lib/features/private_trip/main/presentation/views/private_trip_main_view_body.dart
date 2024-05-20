import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/plan_table.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/table_row_widget.dart';

class PrivatTripMainViewBody extends StatelessWidget {
  const PrivatTripMainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tableList = [
      TableRowWidget(
        onTap: () {},
        text: LocaleKeys.selectYourLocation.tr(),
        image: Assets.imagesIconsSelectLocation,
      ),
      TableRowWidget(
        onTap: () {},
        text: LocaleKeys.enterDestination.tr(),
        image: Assets.imagesIconsEnterDestination,
      ),
      TableRowWidget(
        onTap: () {},
        text: LocaleKeys.selectDates.tr(),
        image: Assets.imagesIconsSelectDates,
      ),
      TableRowWidget(
        onTap: () {},
        text: LocaleKeys.enterPersonNumber.tr(),
      ),
      CustomButton(
          onTap: () {},
          text: LocaleKeys.continueButton.tr(),
          width: MediaQuery.sizeOf(context).width,
          borderRadius: 10,
          height: MediaQuery.sizeOf(context).height * .08,
          style: AppStyles.styleInterBold20(context)
              .copyWith(color: Colors.white, fontSize: 21),
          color: kPrimaryColor),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        EartLogoWithText(data: LocaleKeys.planYourTrip.tr()),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: PlanTable(tableList: tableList),
        ),
        const Spacer(
          flex: 4,
        )
      ],
    );
  }
}
