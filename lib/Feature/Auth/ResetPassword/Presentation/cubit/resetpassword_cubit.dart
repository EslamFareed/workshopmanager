import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/domain/repos/reset_password_repo.dart';

part 'resetpassword_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo repo;
  ResetPasswordCubit(this.repo) : super(ResetpasswordInitial());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordObsecure = false;
  bool confirmPasswordObsecure = false;

  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword({
    required String uuid,
  }) async {
    final isVaild = formKey.currentState!.validate();
    if (isVaild) {
      emit(ResetpasswordLoadingState());

      final result = await repo.resetPassword(
        password: passwordController.text,
        confirmPassowrd: confirmPasswordController.text,
        uuid: uuid,
      );
      result.fold((failure) {
        emit(ResetpasswordFailureState(failure.message));
      }, (result) {
        emit(ResetpasswordSuccessState(result));
      });
    }
  }

  void changeObscure({required String field}) {
    if (field == 'password') {
      passwordObsecure = !passwordObsecure;
      emit(ChangePasswordVisiability(passwordObsecure));
    } else if (field == 'confirmPassword') {
      confirmPasswordObsecure = !confirmPasswordObsecure;
      emit(ChangePasswordVisiability(confirmPasswordObsecure));
    }
  }
}
