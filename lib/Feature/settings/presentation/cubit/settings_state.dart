part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class LogoutLoadingState extends SettingsState {}

final class LogoutSuccessState extends SettingsState {
  final String message;

  const LogoutSuccessState(this.message);
}

final class LogoutFailureState extends SettingsState {
  final String message;

  const LogoutFailureState(this.message);
}

final class LoadingDeleteAccountState extends SettingsState {}

final class ErrorDeleteAccountState extends SettingsState {}

final class SuccessDeleteAccountState extends SettingsState {}
