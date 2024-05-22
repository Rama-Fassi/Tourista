import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class PlanTable extends StatelessWidget {
  const PlanTable({
    super.key,
    required this.tableList,
  });

  final List<Widget> tableList;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: FlexColumnWidth(),
      border: TableBorder.all(
        color: kYellowColor,
        width: 3,
        borderRadius: BorderRadius.circular(10),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children:
          List.generate(5, (index) => TableRow(children: [tableList[index]])),
    );
  }
}
