import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class TicketDuration extends StatelessWidget {
  const TicketDuration({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '4h 19m',
          style: AppStyles.styleInterRegular16(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
        SizedBox(
            width: width * .5,
            child: Divider(
              color: Colors.black.withOpacity(.5),
            )),
        Text(
          LocaleKeys.direct.tr(),
          style: AppStyles.styleInterRegular16(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
      ],
    );
  }
}
