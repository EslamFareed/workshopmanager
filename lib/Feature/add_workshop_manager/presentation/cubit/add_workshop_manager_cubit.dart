import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/domain/add_workshop_manager_repo.dart';
import '../../data/model/add_workshop_manager_model.dart';
part 'add_workshop_manager_state.dart';

class AddWorkshopManagerCubit extends Cubit<AddWorkshopManagerState> {
  final AddWorkshopManagerRepo repo;
  AddWorkshopManagerCubit(this.repo) : super(AddWorkshopManagerInitial());

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> addWorkshopManager() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      emit(AddWorkshopManagerLoadingState());
      final result = await repo.addWorkshopManager(
        jobTitle: jobTitleController.text,
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        workshopsId: [29],
      );
      result.fold(
        (failure) {
          emit(AddWorkshopManagerFailureState(failure.message));
        },
        (result) async {
          emit(AddWorkshopManagerSuccessState(result));
        },
      );
    }
  }
}
