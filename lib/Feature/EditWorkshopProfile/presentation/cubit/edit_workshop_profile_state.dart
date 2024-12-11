part of 'edit_workshop_profile_cubit.dart';

sealed class EditWorkshopProfileState extends Equatable {
  const EditWorkshopProfileState();

  @override
  List<Object> get props => [];
}

final class LoadingWorkshopDataState extends EditWorkshopProfileState {}
final class SuccessWorkshopDataState extends EditWorkshopProfileState {}
final class ErrorWorkshopDataState extends EditWorkshopProfileState {}
final class EditWorkshopProfileInitial extends EditWorkshopProfileState {}

final class EditWorkshopProfileLoadingState extends EditWorkshopProfileState {}

final class EditWorkshopProfilSuccessState extends EditWorkshopProfileState {}

final class EditWorkshopProfileFailureState extends EditWorkshopProfileState {
  final String message;

  const EditWorkshopProfileFailureState(this.message);
}

final class ImagePickerSuccessState extends EditWorkshopProfileState {
  final File logo;

  const ImagePickerSuccessState(this.logo);
}
