part of 'suggested_service_cubit.dart';

sealed class SuggestedServiceState extends Equatable {
  const SuggestedServiceState();

  @override
  List<Object> get props => [];
}

final class SuggestedServiceInitial extends SuggestedServiceState {}

final class SuggestedServiceLoadingState extends SuggestedServiceState {}

final class SuggestedServiceSuccessState extends SuggestedServiceState {
  final List<ServiceModel> service;

  @override
  List<Object> get props => [service];

  const SuggestedServiceSuccessState({required this.service});
}

final class SuggestedServiceFailureState extends SuggestedServiceState {
  final String message;

  const SuggestedServiceFailureState(this.message);
}

final class SuggestedSuccessState extends SuggestedServiceSuccessState {
  final SuggestedServiceModel suggestedService;

  const SuggestedSuccessState(
      {required super.service, required this.suggestedService});
}

final class SuggestedFailureState extends SuggestedServiceSuccessState {
  final String errorMessage;

  const SuggestedFailureState(
      {required super.service, required this.errorMessage});
}
