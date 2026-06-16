import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SssService extends GetxService {
  static const String _localeKey = 'sss_locale';
  static const String _themeKey = 'sss_theme';
  static const String _layoutKey = 'sss_layout';
  static const String _labelKey = 'sss_label';
  static const String _positionKey = 'sss_position';

  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<SssService> init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadLocale();
    _getCurrentPosition();
    _loadThemeMode();
    _loadDesign();
    _loadLabelAvailability();
    // startTimerStream();
    return this;
  }

  void _loadLocale() {
    final String? savedLangCode = _prefs.getString(_localeKey);
    if (savedLangCode != null) {
      final parts = savedLangCode.split('_');
      currentLocale.value = Locale(parts[0], parts[1]);
    } else {
      currentLocale.value = const Locale('en', 'US');
    }
    Get.updateLocale(currentLocale.value);
  }

  void saveLocale(Locale locale) {
    currentLocale.value = locale;
    final localeString = '${locale.languageCode}_${locale.countryCode}';
    _prefs.setString(_localeKey, localeString);
    Get.updateLocale(locale);
  }

  void savePosition(int newPosition) {
    _prefs.setInt(_positionKey, newPosition);
    currentTouchScreenPosition.value = newPosition;
  }

  int _getCurrentPosition() {
    final int? savedPosition = _prefs.getInt(_positionKey);
    currentTouchScreenPosition.value = savedPosition??0;
    return savedPosition??0;
  }

  void _loadThemeMode() {
    final String? savedTheme = _prefs.getString(_themeKey);
    if (savedTheme == 'dark') {
      currentThemeMode.value = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      currentThemeMode.value = ThemeMode.light;
    } else {
      currentThemeMode.value = ThemeMode.system;
    }
  }

  void saveThemeMode(ThemeMode mode) {
    currentThemeMode.value = mode;
    String themeString;
    switch (mode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      default:
        themeString = 'system';
    }
    _prefs.setString(_themeKey, themeString);
    Get.changeThemeMode(mode);
  }

  void _loadDesign() {
    currentLayoutDesign.value = _prefs.getInt(_layoutKey)??0;
  }

  void saveDesign(int position) async {
    await _prefs.setInt(_layoutKey, position);
    currentLayoutDesign.value = position;
  }

  void _loadLabelAvailability() {
    currentLabelAvailability.value = _prefs.getBool(_labelKey)??false;
  }

  void saveLabelAvailability(bool updatedLabel) async {
    await _prefs.setBool(_labelKey, updatedLabel);
    currentLabelAvailability.value = updatedLabel;
  }

}
