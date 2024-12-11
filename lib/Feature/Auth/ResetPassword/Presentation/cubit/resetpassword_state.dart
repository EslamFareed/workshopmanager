part of 'resetpassword_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetpasswordInitial extends ResetPasswordState {}

final class ChangePasswordVisiability extends ResetPasswordState {
  final bool obsecure;

  const ChangePasswordVisiability(this.obsecure);
  @override
  List<Object> get props => [obsecure];
}

final class ResetpasswordLoadingState extends ResetPasswordState {}

final class ResetpasswordFailureState extends ResetPasswordState {
  final String message;

  const ResetpasswordFailureState(this.message);
}

final class ResetpasswordSuccessState extends ResetPasswordState {
  final String message;

  const ResetpasswordSuccessState(this.message);
}
