import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Feature/settings/domain/repo/setting_repo.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/service/shared_pref.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingRepo repo;
  SettingsCubit(this.repo) : super(SettingsInitial());

  Future<void> logout() async {
    final response = await repo.logout();
    response.fold((failure) {
      emit(LogoutFailureState(failure.message));
    }, (successMessage) {
      emit(LogoutSuccessState(successMessage));
    });
  }

  void deleteAccount() async {
    emit(LoadingDeleteAccountState());
    final token = await SharedPref().get(AppSharedPrefrencesKeys.tokenKey);

    try {
      var response = await Dio(BaseOptions(
        headers: {"Authorization": "Bearer $token"},
      )).delete(EndPoints.baseUrl + EndPoints.deleteAccountEndPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SuccessDeleteAccountState());
      } else {
        emit(ErrorDeleteAccountState());
      }
    } catch (e) {
      emit(ErrorDeleteAccountState());
    }
  }
}
