import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Feature/manage_profile/domain/repo/update_profile_repo.dart';

import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/constant/end_points.dart';
import '../../../../di.dart';
import '../models/user_profile_model.dart';

part 'manage_profile_state.dart';

class ManageProfileCubit extends Cubit<ManageProfileState> {
  final UpdateProfileRepo repo;
  ManageProfileCubit(this.repo) : super(ManageProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> update() async {
    emit(ManageProfileLoadingState());
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      final result = await repo.updateProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        companyName: companyNameController.text,
        method: "PUt",
      );
      result.fold(
        (failure) => emit(ManageProfileFailureState(failure.message)),
        (success) => emit(ManageProfileSuccessState()),
      );
    }
  }

  UserProfileModel? profile;
  void getProfile() async {
    emit(LoadingProfileState());
    try {
      var response = await Dio(BaseOptions(headers: {
        "Authorization":
            "Bearer ${preferences.getString(AppSharedPrefrencesKeys.tokenKey)}"
      })).get("${EndPoints.baseUrl}workshop-manager/profile");

      if (response.statusCode == 200 && response.data["success"] == true) {
        profile = UserProfileModel.fromJson(response.data["data"]["user"]);
        nameController.text = profile?.name ?? "";
        phoneController.text = profile?.phone ?? "";
        emailController.text = profile?.email ?? "";
        companyNameController.text = profile?.profile?.companyName ?? "";
        emit(SuccessProfileState());
      } else {
        emit(ErrorProfileState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorProfileState());
    }
  }
}
