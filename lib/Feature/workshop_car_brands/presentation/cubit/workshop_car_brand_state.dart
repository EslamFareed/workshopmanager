part of 'workshop_car_brand_cubit.dart';

sealed class WorkshopCarBrandState extends Equatable {
  const WorkshopCarBrandState();

  @override
  List<Object> get props => [];
}

final class WorkshopCarBrandInitial extends WorkshopCarBrandState {}

final class WorkshopCarBrandLoadingState extends WorkshopCarBrandState {}

final class WorkshopCarBrandSuccessState extends WorkshopCarBrandState {
  final List<WorkshopCarBrand> model;

  @override
  List<Object> get props => [model];

  const WorkshopCarBrandSuccessState(this.model);
}

final class WorkshopCarBrandFailure extends WorkshopCarBrandState {
  final String message;

  const WorkshopCarBrandFailure(this.message);
}

final class WorkshopCarBrandStateUpdated extends WorkshopCarBrandSuccessState {
  final List<String> brands;

  @override
  List<Object> get props => [brands];
  const WorkshopCarBrandStateUpdated(super.model, this.brands);
}
