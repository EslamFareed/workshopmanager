part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpLoadingstate extends OtpState {}

final class OtpSuccessState extends OtpState {
  final OtpModel model;

  const OtpSuccessState(this.model);
}

final class OtpFailureState extends OtpState {
  final String message;

  const OtpFailureState(this.message);
}
