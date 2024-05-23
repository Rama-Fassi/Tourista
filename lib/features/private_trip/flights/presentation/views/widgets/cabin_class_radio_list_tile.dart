import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CabinCalssRadioListTile extends StatefulWidget {
  const CabinCalssRadioListTile({
    super.key,
    required this.onCabinChanged,
  });
  final ValueChanged<String> onCabinChanged;
  @override
  State<CabinCalssRadioListTile> createState() =>
      _CabinCalssRadioListTileState();
}

class _CabinCalssRadioListTileState extends State<CabinCalssRadioListTile> {
  String? cabinClass;
  @override
  Widget build(BuildContext context) {
    List<String> cabinClassNamelist = [
      'Economy',
      'Premium economy',
      'Business',
      'First class'
    ];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(4, (index) {
          return RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              cabinClassNamelist[index],
              style:
                  AppStyles.styleInterMedium18(context).copyWith(fontSize: 16),
            ),
            value: cabinClassNamelist[index],
            groupValue: cabinClass,
            onChanged: (value) {
              setState(() {
                cabinClass = value;
                widget.onCabinChanged(cabinClass!);
              });
            },
          );
        }));
  }
}
