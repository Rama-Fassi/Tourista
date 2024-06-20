import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

import '../../../../../../core/widgets/loading_widget.dart';
import '../../manager/activities_plan_cubit/activities_plan_cubit.dart';

class AddToPlanButtonForActivities extends StatelessWidget {
  const AddToPlanButtonForActivities({
    super.key,
    required this.screenWidth,
    required this.onTap,
    required this.text,
  });
  final String text;
  final double screenWidth;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesPlanCubit, ActivitiesPlanState>(
      builder: (context, state) {
        if (state is ActivitiesPlanSuccess) {
          return Container(
            width: screenWidth,
            height: 75,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              kboxShadow,
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 13, bottom: 10),
              child: CustomButton(
                text: text,
                width: screenWidth * .6,
                borderRadius: 5,
                height: 50,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor,
                onTap: onTap,
              ),
            ),
          );
        } else if (state is ActivitiesPlanFailure){

          return SnackBar(
        
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              color: kPrimaryColor,
              title: 'Warning!',
              message: state.errMessage,
              messageFontSize: 14,
      
            
              contentType: ContentType.warning,
            ),
          );
        } else {
          return LoadingWidget();
        }
        
      },
    );
  }
}
