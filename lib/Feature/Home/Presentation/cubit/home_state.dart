part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeGetWorkshopsLoadingState extends HomeState {}

final class HomeGetWorkshopsSuccessState extends HomeState {
  final List<HomeWorkshopModel> workhops;
  @override
  List<Object> get props => [workhops];
  const HomeGetWorkshopsSuccessState(this.workhops);
}

final class HomeGetWorkshopsFailureState extends HomeState {
  final String message;

  const HomeGetWorkshopsFailureState(this.message);
}

final class DeletedSuccessState extends HomeGetWorkshopsSuccessState {
  final String deletedSuccess;

  const DeletedSuccessState(
    super.workhops, {
    required this.deletedSuccess,
  });
}

final class DeleteFailureState extends HomeGetWorkshopsSuccessState {
  final String failureMessage;
  const DeleteFailureState(
    super.workhops, {
    required this.failureMessage,
  });
}
