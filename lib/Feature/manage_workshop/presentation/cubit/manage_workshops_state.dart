part of 'manage_workshops_cubit.dart';

sealed class ManageWorkshopsState extends Equatable {
  const ManageWorkshopsState();

  @override
  List<Object> get props => [];
}

final class ManageWorkshopsInitial extends ManageWorkshopsState {}

final class ManageWorkshopsSuccessState extends ManageWorkshopsState {
  final String message;

  const ManageWorkshopsSuccessState(this.message);
}

final class ManageWorkshopsFailureState extends ManageWorkshopsState {
  final String message;

  const ManageWorkshopsFailureState(this.message);
}

final class ManageWorkshopsLoadingState extends ManageWorkshopsState {}
