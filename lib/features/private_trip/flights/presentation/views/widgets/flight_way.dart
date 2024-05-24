import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class FlightsWay extends StatefulWidget {
  const FlightsWay({
    super.key,
    required this.onFlightsWayChanged,
  });
  final ValueChanged<String> onFlightsWayChanged;
  @override
  State<FlightsWay> createState() => _FlightsWayState();
}

class _FlightsWayState extends State<FlightsWay> {
  String? flightWay;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              LocaleKeys.roundTrip.tr(),
              style: AppStyles.styleInterSemiBold18(context),
            ),
            value: 'RoundTrip',
            groupValue: flightWay,
            onChanged: (value) {
              setState(() {
                flightWay = value;
                widget.onFlightsWayChanged(flightWay!);
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text(
              LocaleKeys.oneWay.tr(),
              style: AppStyles.styleInterSemiBold18(context),
            ),
            value: 'OneWay',
            groupValue: flightWay,
            onChanged: (value) {
              setState(() {
                flightWay = value;
                widget.onFlightsWayChanged(flightWay!);
              });
            },
          ),
        )
      ],
    );
  }
}
