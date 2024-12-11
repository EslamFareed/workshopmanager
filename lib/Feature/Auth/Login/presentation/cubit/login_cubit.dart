import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/constant.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/models/login_model.dart';
import 'package:workshopmanager/Feature/Auth/Login/domain/repos/login_repo.dart';
import '../../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../../Core/service/shared_pref.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final LocalAuthentication _localAuth;
  LoginCubit(this.loginRepo, this._localAuth) : super(LoginInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = false;
  final formkey = GlobalKey<FormState>();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String deviceName = '';
  bool isChecked = false;

  Future<void> login() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!;
      deviceName = iosInfo.name;
    }
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      emit(LoginLoadedState());
      final result = await loginRepo.login(
        phone: nameController.text,
        password: passwordController.text,
        deviceId: deviceId,
        deviceToken: deviceToken!,
        devicename: deviceName,
      );
      result.fold(
        (failure) {
          emit(
            LoginFauilreState(failure.message),
          );
        },
        (result) async {
          await SharedPref().set(
              AppSharedPrefrencesKeys.tokenKey, result.authorization!.token!);
          emit(LoginSuccessState(result));
        },
      );
    }
  }

  void changeObscure() {
    isObsecure = !isObsecure;
    emit(ChangeObscureState());
  }

  void changeCheckBoxValu(bool value) async {
    isChecked = !isChecked;
    emit(ChangeCheckBoxValue());
  }

  Future<void> fingerprint() async {
    emit(FingerprintLoading());

    try {
      bool canAuthenticate = await _localAuth.canCheckBiometrics;

      if (!canAuthenticate) {
        emit(FingerprintError("Biometric authentication not available."));
        return;
      }

      bool authenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        emit(FingerprintAuthenticated());
      } else {
        emit(FingerprintError("Authentication failed."));
      }
    } catch (e) {
      emit(FingerprintError("An error occurred during authentication."));
    }
  }
}
