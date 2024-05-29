import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'add_activities_column.dart';

class AddActivitiesListView extends StatefulWidget {
  const AddActivitiesListView({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<AddActivitiesListView> createState() => _AddActivitiesListViewState();
}

class _AddActivitiesListViewState extends State<AddActivitiesListView> {
  final String _startDateString = '2024-5-25';
  DateTime _startDate = DateTime.now();
  final String _endDateString = '2024-6-2';
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _parseStartDate();
  }

  void _parseStartDate() {
    _startDate = DateFormat('yyyy-MM-dd').parse(_startDateString);
    _endDate = DateFormat('yyyy-MM-dd').parse(_endDateString);
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateTimes = List.generate(
      (_endDate.difference(_startDate).inDays + 1),
      (i) => _startDate.add(Duration(days: i)),
    );

    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AddActivitiesColumn(
                    screenWidth: widget.screenWidth,
                    data: DateFormat('EEEE d MMMM ').format(dateTimes[index]),
                  );
                },
                itemCount: dateTimes.length,
              )),
        ),
        const Gap(80)
      ],
    );
  }
}




/*
    Text(
      DateFormat('EEEE dd MMMM ').format(dateTimes[widget.index]),
      style: AppStyles.styleInterSemiBold20(context),
      textAlign: TextAlign.start,
    );*/

   //  DateListTile(date: dateTimes[widget.index]);
    /* return ListView.builder(
      itemCount: dateTimes.length,
      itemBuilder: (context, index) {
        return DateListTile(date: dateTimes[index]);
      },
    );*/
 

/*class DateListTile extends StatelessWidget {
  final DateTime date;

  const DateListTile({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the day name based on the current date
    String dayName = _getDayName(date);

    return Text(
      DateFormat('EEEE dd MMMM ').format(date),
      style: AppStyles.styleInterSemiBold20(context),
      textAlign: TextAlign.start,
    );
  }

  String _getDayName(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}
*/