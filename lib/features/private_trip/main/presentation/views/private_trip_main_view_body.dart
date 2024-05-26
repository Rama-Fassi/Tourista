import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/create_trip_cubit/create_trip_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/person_number_bottom_sheet.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/plan-and_plane_table.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/table_row_widget.dart';

class PrivatTripMainViewBody extends StatefulWidget {
  const PrivatTripMainViewBody({Key? key}) : super(key: key);

  @override
  State<PrivatTripMainViewBody> createState() => _PrivatTripMainViewBodyState();
}

class _PrivatTripMainViewBodyState extends State<PrivatTripMainViewBody> {
  DateTime? startDate;
  DateTime? endDate;
  int selectedNumber = 0;
  dynamic selectedcity;
  dynamic enterCity;

  @override
  Widget build(BuildContext context) {
    List<Widget> tableList = [
      TableRowWidget(
        padding: 18,
        onTap: () async {
          var result =
              await GoRouter.of(context).push(AppRouter.kSelectLocationView);
          setState(() {
            selectedcity = result;
          });
        },
        text: selectedcity == null
            ? LocaleKeys.selectYourLocation.tr()
            : "${selectedcity['city']}",
        image: Assets.imagesIconsSelectLocation,
      ),
      TableRowWidget(
        padding: 18,
        onTap: () async {
          var result =
              await GoRouter.of(context).push(AppRouter.kEnterDestinationView);
          setState(() {
            enterCity = result;
          });
        },
        text: enterCity == null
            ? LocaleKeys.enterDestination.tr()
            : "${enterCity['city']}",
        image: Assets.imagesIconsEnterDestination,
      ),
      TableRowWidget(
        padding: 18,
        onTap: () async {
          var results = await createCalendar(context);
          if (results != null && results.isNotEmpty) {
            startDate = results[0];
            endDate = results[1];
            setState(() {});
          }
        },
        text: (startDate == null && endDate == null)
            ? LocaleKeys.selectDates.tr()
            : "$startDate".substring(0, 10) + " _ $endDate".substring(0, 13),
        image: Assets.imagesIconsSelectDates,
      ),
      TableRowWidget(
        padding: 18,
        onTap: () {
          showPersonNumberBottomSheet(context);
        },
        text: selectedNumber == 0
            ? LocaleKeys.enterPersonNumber.tr()
            : '$selectedNumber ${LocaleKeys.person.tr()}',
      ),
      CustomButton(
        onTap: () {
          BlocProvider.of<CreateTripCubit>(context).createTripCubitFun(
            idFrom: '${selectedcity['id']}',
            idTo: '${enterCity['id']}',
            dateOfTrip: "$startDate".substring(0, 10),
            dateEndOfTrip: '$endDate'.substring(0, 10),
            personNumber: '$selectedNumber',
          );
        },
        text: LocaleKeys.continueButton.tr(),
        width: MediaQuery.of(context).size.width,
        borderRadius: 10,
        height: MediaQuery.of(context).size.height * .08,
        style: AppStyles.styleInterBold20(context)
            .copyWith(color: Colors.white, fontSize: 21),
        color: kPrimaryColor,
      ),
    ];

    return BlocConsumer<CreateTripCubit, CreateTripState>(
      listener: (context, state) {
        if (state is CreateTripFailure) {
          customSnackBar(context, state.errMessage);
        } else if (state is CreateTripSuccess) {
          GoRouter.of(context)
              .push(AppRouter.kPrivateTripTapBar, extra: state.createTripModel);
        }
      },
      builder: (context, state) {
        return state is CreateTripLoading
            ? Center(child: Lottie.asset(Assets.imagesLottieEarthLoading))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  EartLogoWithText(data: LocaleKeys.planYourTrip.tr()),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: PlanAndPlaneTable(
                      tableList: tableList,
                      rowNumber: 5,
                    ),
                  ),
                  const Spacer(flex: 4),
                ],
              );
      },
    );
  }

  Future<List<DateTime?>?> createCalendar(BuildContext context) {
    return showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
      ),
      dialogSize: const Size(325, 400),
      value: [],
      borderRadius: BorderRadius.circular(15),
    );
  }

  void showPersonNumberBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return PersonNumberBottomSheet(
          onNumberChanged: (int number) {
            setState(() {
              selectedNumber = number;
            });
          },
        );
      },
    );
  }
}
