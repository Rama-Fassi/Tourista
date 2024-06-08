import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'activity_card_state.dart';

class ActivityCardCubit extends Cubit<ActivityCardState> {
  ActivityCardCubit()
      : super(const ActivityCardState(
          activityName: null,
          activityImage: null,
          activityDesc: null,
          activityId: null,
          activitiesCardData: null,
        ));

  void setactivityName(String? activityName) {
    emit(state.copyWith(activityName: activityName));
  }

  void setactivityImage(String? activityImage) {
    emit(state.copyWith(activityImage: activityImage));
  }

  void setactivityDesc(String? activityDesc) {
    emit(state.copyWith(activityDesc: activityDesc));
  }

  void setactivityId(int? activityId) {
    emit(state.copyWith(activityId: activityId));
  }

  void setactivitiesCardData(int dayIndex, Map<String, dynamic> activityData) {
    final updatedData = Map<int, List<Map<String, dynamic>>>.from(
        state.activitiesCardData ?? {});

    if (updatedData.containsKey(dayIndex)) {
      updatedData[dayIndex]!.add(activityData);
    } else {
      updatedData[dayIndex] = [activityData];
    }

    emit(state.copyWith(activitiesCardData: updatedData));

   // print(state.activitiesCardData?[dayIndex].toString());
  }
}
