import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/domain/repos/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo repo;
  ForgetPasswordCubit(this.repo) : super(ForgetPasswordInitial());

  final TextEditingController controller = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    final isVaild = formKey.currentState!.validate();
    if (isVaild) {
      emit(ForgetPasswordLoadingState());
      final result = await repo.forgetPassword(phone: controller.text);
      result.fold(
        (left) => emit(ForgetPasswordFailureState(left.message)),
        (right) => emit(ForgetPasswordSuccessState(right)),
      );
    }
  }
}
