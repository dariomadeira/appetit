import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//  lenguajes que soporta
const kSupportedLenguajes = [
  Locale('es', ''),
  Locale('en', ''),
];

class AppLocalizations {

  // variables
  final Locale locale;
  Map<String, String> _localizedStrings;

  // constructor
  AppLocalizations(this.locale);

  // Método auxiliar para mantener el código en los widgets concisos
  // Se accede a las localizaciones utilizando una sintaxis InheritedWidget "of"
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Miembro estático para tener un acceso simple al delegate desde la MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // cargar todas las traduciones en memoria
  Future<bool> load() async {
    // Cargar el archivo JSON de idioma de la carpeta lang en assets
    String jsonString;
    try {
      jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    } catch (_) {
      print("Error de carga de archivo de traduciones");
    }
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // Se llamará a este método desde cada widget que necesite un texto localizado
  String translate(String key) {
    if (_localizedStrings.containsKey(key)) {
      return _localizedStrings[key];
    } else {
      var localizedValue = key;
      assert(() {
        localizedValue = "Falta traducción de $key";
        return true;
      }());
      return localizedValue;
    }
  }
}

// delegate
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  
  // Esta instancia de delegate nunca cambiará (¡ni siquiera tiene campos!)
  // Puede proporcionar un constructor constante.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    try {
      kSupportedLenguajes.firstWhere((element) => element.languageCode == locale.languageCode);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // La clase AppLocalizations es donde realmente se ejecuta la carga JSON
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
