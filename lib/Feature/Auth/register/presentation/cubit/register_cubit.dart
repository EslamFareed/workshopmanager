import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshopmanager/Core/constant/constant.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/models/login_model.dart';
import 'package:workshopmanager/Feature/Auth/register/domian/repo/register_repo.dart';

import '../../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../../Core/func/show_toast.dart';
import '../../../../../Core/service/shared_pref.dart';
import '../widget/custom_persnoal_information.dart';
import '../widget/custom_security_information.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo repo;
  RegisterCubit(this.repo) : super(RegisterInitial());
  //! Cotrollers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController webSiteController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final companyInfoFormKey = GlobalKey<FormState>();
  bool passwordObsecure = false;
  bool confirmPassowordObsecure = false;

  //!files
  File? taxFile;
  File? companyRegisteration;
  ImagePicker imagePick = ImagePicker();

  int currentStep = 0;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String deviceName = '';

  //! Steper Counter =====================
  List<Step> steperCounter(context) => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            label: const CustomAppText(
              text: " البيانات الشخصية",
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
            title: const Text(""),
            content: personalInfromationWidget(context)),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          label: const CustomAppText(
            text: " بيانات الامان",
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
          title: const Text(""),
          content: securityInfromationWidget(context),
        ),
      ];

//! first Step=================
  void finishStep1(BuildContext context) {
    final step1isValid = formKey.currentState!.validate();

    if (step1isValid) {
      pageIncrement();
    }
  }

//! Second Step================
  void finishStep2(BuildContext context) {
    final isValid = companyInfoFormKey.currentState!.validate();

    if (!isValid) return;

    if ((taxFile != null || companyRegisteration != null)) {
      register();
    } else {
      showToast(message: "please select the registration images");
    }
  }

  //! Page Increment Function ================
  void pageIncrement() {
    currentStep += 1;
    emit(SignUpPageIncrementState());
  }

//! Page Decrement Function ================
  void pageDecrement() {
    currentStep -= 1;
    emit(SignUpPageDecrementState());
  }

//! Change Page Function
  void changePage(int step) {
    final vaild = formKey.currentState!.validate();
    if (vaild) {
      currentStep = step;
      emit(SignUpChangePageState());
    }
  }

  //!Company Registeration image ==========Future<void> imagePicker(ImageSource source) async {
  Future<void> companyRegisterationPicker(ImageSource source) async {
    try {
      final pick = await imagePick.pickImage(source: source);
      if (pick != null) {
        companyRegisteration = File(pick.path);
        emit(ImagePickerSuccessState(companyRegisteration!));
      }
    } catch (e) {
      rethrow;
    }
  }

  //! Tax Image Picker
  Future<void> taximagePicker(ImageSource source) async {
    try {
      final pick = await imagePick.pickImage(source: source);
      if (pick != null) {
        taxFile = File(pick.path);
        emit(TaxPickerSuccessState(taxFile!));
      }
    } catch (e) {
      rethrow;
    }
  }

  //! register
  Future<void> register() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!;
      deviceName = iosInfo.name;
    }
    final isValid = companyInfoFormKey.currentState!.validate();
    if (isValid) {
      emit(RegisterLoadingState());
      final result = await repo.register(
        name: nameController.text,
        phone: phoneNumberController.text,
        email: emailController.text,
        deviceName: deviceName,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        companyName: companyNameController.text,
        deviceId: deviceId,
        deviceToken: deviceToken!,
        taxImage: taxFile!,
        companyRegisteration: companyRegisteration!,
      );
      result.fold(
        (failure) {
          emit(
            RegisterFailureState(failure.message),
          );
        },
        (result) async {
          await SharedPref().set(
              AppSharedPrefrencesKeys.tokenKey, result.authorization!.token!);
          emit(RegisterSuccessState(result));
        },
      );
    }
  }
}
