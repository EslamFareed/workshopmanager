import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../data/model/show_manager_info_model.dart';
import '../../domain/repo/show_manager_repo.dart';

part 'show_manager_info_state.dart';

class ShowManagerInfoCubit extends Cubit<ShowManagerInfoState> {
  final ShowManagerRepo repo;
  ShowManagerInfoCubit(this.repo) : super(ShowManagerInfoInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Future<void> showManager(String id) async {
    emit(ShowManagerLoadingState());
    final result = await repo.showManager(id);
    result.fold(
      (failure) => emit(ShowManagerFailureState(failure.message)),
      (result) => emit(ShowManagerSuccessState(manager: result)),
    );
  }

  Future<void> updateManger(String id) async {
    ShowManagerInfoModel showManagerInfoModel =
        (state as ShowManagerSuccessState).manager;

    final result = await repo.updateManger(
      id,
      confirmPassword: confirmPasswordController.text,
      email: emailController.text,
      jobTitle: jobTitleController.text,
      method: "PUT",
      name: nameController.text,
      password: passwordController.text,
      phone: phoneController.text,
      workshopsId: [22],
    );
    result.fold(
      (failure) => emit(UpdateManagerFailureState(
          manager: showManagerInfoModel, failure.message)),
      (result) => emit(UpdateManagerSuccessState(result, manager: result)),
    );
  }
}
