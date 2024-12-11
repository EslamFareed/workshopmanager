part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class SignUpPageIncrementState extends RegisterState {}

final class SignUpPageDecrementState extends RegisterState {}

final class SignUpChangePageState extends RegisterState {}

final class ImagePickerSuccessState extends RegisterState {
  final File image;

  const ImagePickerSuccessState(this.image);
}

final class TaxPickerSuccessState extends RegisterState {
  final File image;

  const TaxPickerSuccessState(this.image);
}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final LoginModel model;

  const RegisterSuccessState(this.model);
}

final class RegisterFailureState extends RegisterState {
  final String message;

  const RegisterFailureState(this.message);
}
