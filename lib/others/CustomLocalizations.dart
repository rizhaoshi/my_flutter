import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CustomLocalizations {
  final Locale locale;

  CustomLocalizations(this.locale);

  // static Map<String, Map<String, String>> _loclizedValues = {
  //   'en': {'title': "Home", 'greet': "Holle"},
  //   'zh': {'title': "首页", 'greet': "你好"},
  // };

  Map<String, String>? _localizedValues;

  String? t(String key) {
    return _localizedValues![key];
  }

  Future<bool> loadJson() async {
    String jsonStr =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    _localizedValues =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  static CustomLocalizationsDelegate delegate = CustomLocalizationsDelegate();

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomLocalizations);
  }
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) async {
    // return SynchronousFuture(CustomLocalizations(locale));
    CustomLocalizations localizations = CustomLocalizations(locale);
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    return false;
  }
}
