import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  static const locale = Locale('en', 'US');
  static const fallbackLocale = Locale('en', 'US');

  static final langs = [
    'English',
    'Français',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('fr', 'FR'),
  ];

  static final Map<String, Map<String, String>> _translations = {};

  static Future<void> loadTranslations() async {
    final enUS = await rootBundle.loadString('assets/localization/en_US.json');
    final frFR = await rootBundle.loadString('assets/localization/fr_FR.json');

    _translations['en_US'] = Map<String, String>.from(json.decode(enUS));
    _translations['fr_FR'] = Map<String, String>.from(json.decode(frFR));
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
