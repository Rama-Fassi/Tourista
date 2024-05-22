import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/city_select_location_list_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/custom_enter_text_field.dart';

class EnterDestinationViewBody extends StatelessWidget {
  const EnterDestinationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(16),
          CustomEnterTextField(
            label: LocaleKeys.enterDestination.tr(),
            onChanged: (p0) {},
          ),
          const Gap(18),
          const CitySelectLocationListView()
        ],
      ),
    );
  }
}
