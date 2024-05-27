import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';

class ChooseAirportsWidget extends StatefulWidget {
  const ChooseAirportsWidget({
    super.key,
    required this.onWhereFromChanged,
    required this.onWhereToChanged,
    required this.tripId,
  });
  final int tripId;

  final ValueChanged<Map<String, dynamic>> onWhereFromChanged;
  final ValueChanged<Map<String, dynamic>> onWhereToChanged;
  @override
  State<ChooseAirportsWidget> createState() => _ChooseAirportsWidgetState();
}

class _ChooseAirportsWidgetState extends State<ChooseAirportsWidget> {
  dynamic whereFromAirport;
  dynamic whereToAirport;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            var result = await GoRouter.of(context)
                .push(AppRouter.kWhereFromAirportView, extra: widget.tripId);
            setState(() {
              whereFromAirport = result;
              widget.onWhereFromChanged(whereFromAirport ?? {});
            });
          },
          child: Text(
            whereFromAirport == null ||
                    whereFromAirport['airport'].toString().isEmpty
                ? LocaleKeys.whereFrom.tr()
                : whereFromAirport['airport'],
            style: whereFromAirport == null
                ? AppStyles.styleInterRegular16(context)
                    .copyWith(color: Colors.black45)
                : AppStyles.styleInterRegular16(context),
          ),
        ),
        const Gap(10),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .65,
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        const Gap(10),
        GestureDetector(
          onTap: () async {
            var result = await GoRouter.of(context)
                .push(AppRouter.kWhereToAirportView, extra: widget.tripId);
            setState(() {
              whereToAirport = result;
              widget.onWhereToChanged(whereToAirport ?? {});
            });
          },
          child: GestureDetector(
            child: Text(
              whereToAirport == null ||
                      whereToAirport['airport'].toString().isEmpty
                  ? LocaleKeys.whereTo.tr()
                  : whereToAirport['airport'],
              style: whereToAirport == null
                  ? AppStyles.styleInterRegular16(context)
                      .copyWith(color: Colors.black45)
                  : AppStyles.styleInterRegular16(context),
            ),
          ),
        ),
      ],
    );
  }
}
