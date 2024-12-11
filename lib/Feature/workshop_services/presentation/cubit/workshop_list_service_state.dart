part of 'workshop_list_service_cubit.dart';

sealed class WorkshopListServiceState extends Equatable {
  const WorkshopListServiceState();

  @override
  List<Object> get props => [];
}

final class WorkshopListServiceInitial extends WorkshopListServiceState {}

final class WorkshopListServiceLoadingState extends WorkshopListServiceState {}

final class WorkshopListServiceSuccessState extends WorkshopListServiceState {
  final List<WorkshopListService> service;

  const WorkshopListServiceSuccessState(this.service);
}

final class WorkshopListServiceFailureState extends WorkshopListServiceState {
  final String message;

  const WorkshopListServiceFailureState(this.message);
}
