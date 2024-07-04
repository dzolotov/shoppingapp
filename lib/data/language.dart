import 'package:flutter/material.dart';

enum SupportedLanguages {
  ru,
  en,
}

class AppLanguageStateHolder extends ChangeNotifier {
  SupportedLanguages _language = SupportedLanguages.en;

  SupportedLanguages get language => _language;

  String get flag => language == SupportedLanguages.en ? 'us' : language.name;

  void switchLanguage() {
    int nextIndex = (_language.index + 1) % SupportedLanguages.values.length;
    _language = SupportedLanguages.values[nextIndex];
    notifyListeners();
  }
}
