import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/manager/add_review_cubit/add_review_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/customer_support_button.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/service_locator.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../data/repos/profile_repo_impl.dart';
import '../../manager/all_reviews_cubit/all_reviews_cubit.dart';
import 'about_us_button.dart';
import 'reviews_button.dart';

class HelpAndSupportSection extends StatelessWidget {
  const HelpAndSupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Help_and_support.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(18),
        const CustomerSupportButton(),
        const Gap(25),
    
        const ReviewsButton(),
        const Gap(25),
        const AboutUsButton(),
      ],
    );
  }
}
