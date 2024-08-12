import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/notification/presentation/manager/cubit/cnacele_delay_trip_cubit.dart';

class CanceleDelayTripButton extends StatelessWidget {
  const CanceleDelayTripButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CnaceleDelayTripCubit(),
      child: BlocConsumer<CnaceleDelayTripCubit, CnaceleDelayTripState>(
        listener: (context, state) {
          if (state is CnaceleDelayTripFailure) {
            customSnackBar(context, state.errMessage);
          }
          if (state is CnaceleDelayTripSuccess) {
            customSuccessSnackBar(context,
                'The Trip Canceled succeessfully and you get all your money back');
          }
        },
        builder: (context, state) {
          return state is CnaceleDelayTripLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : CustomButton(
                  onTap: () {},
                  text: 'Cnacele',
                  width: 140,
                  height: 40,
                  borderRadius: 12,
                  style: AppStyles.styleInterBold20(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor);
        },
      ),
    );
  }
}
