import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitialState());
  //AppSharedPrefrences? appSharedPrefrences;

  void changeLanguage(int index) {
    final locale = index == 0 ? const Locale('ar') : const Locale('en');
    emit(ChangeLanguageState(locale));
    S.load(locale);
  }
}
