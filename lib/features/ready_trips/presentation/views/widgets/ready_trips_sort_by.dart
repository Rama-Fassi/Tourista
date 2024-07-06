import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class ReadyTripsSortBy extends StatefulWidget {
  const ReadyTripsSortBy({
    Key? key,
  }) : super(key: key);

  @override
  State<ReadyTripsSortBy> createState() => _ReadyTripsSortByState();
}

class _ReadyTripsSortByState extends State<ReadyTripsSortBy> {
  int? readySort;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        PopupMenuButton<int>(
          offset: Offset(0, 45),
          constraints:
              BoxConstraints.expand(width: double.infinity, height: 250),
          icon: Row(
            children: [
              Text(LocaleKeys.sort.tr()),
              const Gap(2),
              SvgPicture.asset(Assets.imagesIconsSortDown),
            ],
          ),
          itemBuilder: (context) => <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              child: SortByMenuItems(
                onItemSelected: (value) {
                  setState(() {
                    readySort = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SortByMenuItems extends StatefulWidget {
  final void Function(int value)? onItemSelected;

  const SortByMenuItems({Key? key, this.onItemSelected}) : super(key: key);

  @override
  _SortByMenuItemsState createState() => _SortByMenuItemsState();
}

class _SortByMenuItemsState extends State<SortByMenuItems> {
  List<String> readyTripsNamelist = [
    LocaleKeys.General.tr(),
    LocaleKeys.newest.tr(),
    LocaleKeys.closet.tr(),
    LocaleKeys.pricehightolow.tr(),
    LocaleKeys.pricelowtohigh.tr(),
  ];
  List<int> valueList = [1, 2, 3, 4, 5];

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<PopupMenuEntry<int>>.generate(
        valueList.length,
        (index) => PopupMenuItem<int>(
          value: valueList[index],
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              readyTripsNamelist[index],
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 16),
            ),
            value: valueList[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
              widget.onItemSelected?.call(value!);
            },
          ),
        ),
      ),
    );
  }
}
