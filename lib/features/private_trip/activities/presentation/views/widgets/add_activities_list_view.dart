import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_to_plan_button.dart';
import '../../../../main/data/models/create_trip_model/create_trip_model.dart';
import 'add_activities_column.dart';

class AddActivitiesListView extends StatefulWidget {
  const AddActivitiesListView({
    super.key,
    required this.screenWidth,
    required this.createTripModel,
  });
  final CreateTripModel createTripModel;

  final double screenWidth;

  @override
  State<AddActivitiesListView> createState() => _AddActivitiesListViewState();
}

class _AddActivitiesListViewState extends State<AddActivitiesListView> {
  String? _startDateString;
  DateTime _startDate = DateTime.now();
  String? _endDateString;
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startDateString = widget.createTripModel.tripId!.dateOfTrip;
    _endDateString = widget.createTripModel.tripId!.dateEndOfTrip;
    _parseStartDate();
  }

  void _parseStartDate() {
    _startDate = DateFormat('yyyy-MM-dd').parse(_startDateString!);
    _endDate = DateFormat('yyyy-MM-dd').parse(_endDateString!);
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateTimes = List.generate(
      (_endDate.difference(_startDate).inDays + 1),
      (i) => _startDate.add(Duration(days: i)),
    );
 

   Map<String, dynamic> activitiesPlan = {"planes": []};

    return Stack(children: [
      Align(
          alignment: Alignment.bottomCenter,
          child: AddToPlanButton(
              screenWidth: widget.screenWidth,
              onTap: () {

                print('from listview');
              })),
      Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return AddActivitiesColumn(
                      index: index,
                      screenWidth: widget.screenWidth,
                      data: DateFormat('EEEE d MMMM ').format(dateTimes[index]),
                      createTripModel: widget.createTripModel,
                      tripId: widget.createTripModel.tripId!.id,
                    );
                  },
                  itemCount: dateTimes.length,
                )),
          ),
          const Gap(80)
        ],
      ),
    ]);
  }
}
