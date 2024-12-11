import 'dart:ui';

abstract class AppLanguageState {}

class AppLanguageInitialState extends AppLanguageState {}

class ChangeLanguageState extends AppLanguageState {
  final Locale _locale;

  ChangeLanguageState(this._locale);

  @override
  Locale get locale => _locale;
}
