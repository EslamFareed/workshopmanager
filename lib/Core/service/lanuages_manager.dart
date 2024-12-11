import 'package:flutter/material.dart';

class LanguageManager {
  static String getDeviceLanguage(ctx) {
    return Localizations.localeOf(ctx).languageCode;
  }
}
