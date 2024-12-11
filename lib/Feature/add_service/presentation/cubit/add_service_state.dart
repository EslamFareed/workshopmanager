part of 'add_service_cubit.dart';

sealed class AddServiceState extends Equatable {
  const AddServiceState();

  @override
  List<Object> get props => [];
}

final class AddServiceInitial extends AddServiceState {}

final class AddServiceLoadingState extends AddServiceState {}

final class AddServiceSuccessState extends AddServiceState {}

final class AddServiceFailureState extends AddServiceState {
  final String message;
  const AddServiceFailureState(this.message);
  @override
  List<Object> get props => [message];
}

final class ActiveServiceSuccessState extends AddServiceSuccessState {
  final String message;

  ActiveServiceSuccessState(this.message);
}

final class ActiveServiceFailureState extends AddServiceSuccessState {
  final String message;

  ActiveServiceFailureState(this.message);
}
