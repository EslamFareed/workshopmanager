import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../EditWorkshopProfile/presentation/models/workshop_data_model.dart';

part 'workshop_working_time_state.dart';

class WorkshopWorkingTimeCubit extends Cubit<WorkshopWorkingTimeState> {
  WorkshopWorkingTimeCubit() : super(WorkshopWorkingTimeInitial());
  List<String> days = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة'
  ];
  List<bool> isDayActive = [true, true, true, true, true, true, false];

  void start(List<WorkingHours> workingdays) {
    for (var i = 0; i < workingdays.length; i++) {
      var element = workingdays[i];
      isDayActive[i] = element.isOff == 0;

      fromTimes[i] = TimeOfDay(
          hour: int.parse(element.startHour!.split(":")[0]),
          minute: int.parse(element.startHour!.split(":")[1]));
      toTimes[i] = TimeOfDay(
          hour: int.parse(element.endHour!.split(":")[0]),
          minute: int.parse(element.endHour!.split(":")[1]));
      // fromTimes[i] =
      //     TimeOfDay.fromDateTime(DateTime.parse(element.startHour ?? ""));
      // toTimes[i] =
      //     TimeOfDay.fromDateTime(DateTime.parse(element.endHour ?? ""));
    }
  }

  List<TimeOfDay> fromTimes =
      List.filled(7, const TimeOfDay(hour: 8, minute: 30));

  List<TimeOfDay> toTimes =
      List.filled(7, const TimeOfDay(hour: 17, minute: 0));
  Future<void> selectTime(
    BuildContext context,
    int index,
    bool isStartTime,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? fromTimes[index] : toTimes[index],
    );
    if (picked != null) {
      if (isStartTime) {
        fromTimes[index] = picked;
        emit(ChangeFromTimeValueState(List.from(fromTimes)));
      } else {
        toTimes[index] = picked;
        emit(ChangeToTimeValueState(List.from(toTimes)));
      }
    }
  }

  void changeValue(bool value, int index) {
    isDayActive[index] = value;
    emit(ChangeSwitchButtonValue(List.from(isDayActive)));
  }

  String getEnglishDay(String arabicDay) {
    switch (arabicDay) {
      case 'السبت':
        return 'Saturday';
      case 'الأحد':
        return 'Sunday';
      case 'الاثنين':
        return 'Monday';
      case 'الثلاثاء':
        return 'Tuesday';
      case 'الأربعاء':
        return 'Wednesday';
      case 'الخميس':
        return 'Thursday';
      case 'الجمعة':
        return 'Friday';
      default:
        return arabicDay;
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute:00";
  }

  List<Map<String, dynamic>> getFormattedDays() {
    final formattedDays = <Map<String, dynamic>>[];

    for (int i = 0; i < days.length; i++) {
      formattedDays.add({
        "day": getEnglishDay(days[i]).toLowerCase(),
        "start_hour": formatTimeOfDay(fromTimes[i]),
        "end_hour": formatTimeOfDay(toTimes[i]),
        "is_off": isDayActive[i] ? 0 : 1,
      });
    }
    log("days selected ===================$formattedDays");

    return formattedDays;
  }
}
