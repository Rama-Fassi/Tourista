import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/profile/presentation/manager/all_reviews_cubit/all_reviews_cubit.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_router.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import 'profile_text_button.dart';

class ReviewsButton extends StatelessWidget {
  const ReviewsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kReviewsView);
        },
        width: 27,
        height: 27,
        data: LocaleKeys.Reviews.tr(),
        assetName: Assets.imagesIconsCarbonStarReviewIcon);
  }
}
