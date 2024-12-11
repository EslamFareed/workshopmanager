part of 'about_workshop_cubit.dart';

sealed class AboutWorkshopState extends Equatable {
  const AboutWorkshopState();

  @override
  List<Object> get props => [];
}

final class AboutWorkshopInitial extends AboutWorkshopState {}

final class AboutWorkshopLoadingState extends AboutWorkshopState {}

final class AboutWorkshopSuccessState extends AboutWorkshopState {
  final AboutWorkshopModel workshop;

  const AboutWorkshopSuccessState(this.workshop);
}

final class AboutWorkshopFailureState extends AboutWorkshopState {
  final String message;

  const AboutWorkshopFailureState(this.message);
}
