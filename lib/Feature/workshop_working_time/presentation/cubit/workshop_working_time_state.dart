part of 'workshop_working_time_cubit.dart';

sealed class WorkshopWorkingTimeState extends Equatable {
  const WorkshopWorkingTimeState();

  @override
  List<Object> get props => [];
}

final class WorkshopWorkingTimeInitial extends WorkshopWorkingTimeState {}

final class ChangeFromTimeValueState extends WorkshopWorkingTimeState {
  final List<TimeOfDay> fromTimes;
  @override
  List<Object> get props => [fromTimes];

  const ChangeFromTimeValueState(this.fromTimes);
}

final class ChangeToTimeValueState extends WorkshopWorkingTimeState {
  final List<TimeOfDay> toTimes;

  @override
  List<Object> get props => [toTimes];

  const ChangeToTimeValueState(this.toTimes);
}

final class ChangeSwitchButtonValue extends WorkshopWorkingTimeState {
  final List<bool> value;

  @override
  List<Object> get props => [value];

  const ChangeSwitchButtonValue(this.value);
}
