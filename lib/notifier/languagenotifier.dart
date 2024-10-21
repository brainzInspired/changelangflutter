import 'package:flutter/material.dart';

class LanguageNotifier extends ChangeNotifier {
static final LanguageNotifier _instance = LanguageNotifier._internal();

String _currentLanguage = 'English';

// Getter to access the current language
String get currentLanguage => _currentLanguage;

// Factory constructor for singleton pattern
factory LanguageNotifier() {
  return _instance;
}

LanguageNotifier._internal();

// Method to change the language and notify listeners
void changeLanguage(String newLanguage) {
  _currentLanguage = newLanguage;
  notifyListeners(); // Notify Provider listeners about the language change
  }
}
