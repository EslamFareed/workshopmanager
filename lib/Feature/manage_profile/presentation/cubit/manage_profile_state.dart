part of 'manage_profile_cubit.dart';

sealed class ManageProfileState extends Equatable {
  const ManageProfileState();

  @override
  List<Object> get props => [];
}

final class ManageProfileInitial extends ManageProfileState {}
final class LoadingProfileState extends ManageProfileState {}
final class SuccessProfileState extends ManageProfileState {}
final class ErrorProfileState extends ManageProfileState {}

final class ManageProfileLoadingState extends ManageProfileState {}

final class ManageProfileFailureState extends ManageProfileState {
  final String message;

  const ManageProfileFailureState(this.message);
}

final class ManageProfileSuccessState extends ManageProfileState {}
