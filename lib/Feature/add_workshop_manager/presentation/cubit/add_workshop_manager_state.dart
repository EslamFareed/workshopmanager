part of 'add_workshop_manager_cubit.dart';

sealed class AddWorkshopManagerState extends Equatable {
  const AddWorkshopManagerState();

  @override
  List<Object> get props => [];
}

final class AddWorkshopManagerInitial extends AddWorkshopManagerState {}

final class AddWorkshopManagerLoadingState extends AddWorkshopManagerState {}

final class AddWorkshopManagerSuccessState extends AddWorkshopManagerState {
  final AddWorkshopManagerModel addWorkshopManager;

  const AddWorkshopManagerSuccessState(this.addWorkshopManager);
}

final class AddWorkshopManagerFailureState extends AddWorkshopManagerState {
  final String message;

  const AddWorkshopManagerFailureState(this.message);
}
