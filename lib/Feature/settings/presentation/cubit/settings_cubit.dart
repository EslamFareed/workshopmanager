import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/settings/domain/repo/setting_repo.dart';
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
}
