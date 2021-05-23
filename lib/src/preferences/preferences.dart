import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  
  // PATRÓN SINGLETÓN
  static final AppPreferences _thisInstance = new AppPreferences._internal();
  factory AppPreferences() {
    return _thisInstance;
  }
  AppPreferences._internal();

  // DECLARACIONES
  SharedPreferences _prefs;

  // CREAR INSTANCIA
  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // BORRAR TODAS LAS NOTIFICACIONES
  resetAll() {
    _prefs.clear();
  }

  // QUITAR NOTIFICACIÓN
  removePreference(String key) {
    _prefs.remove(key);
  }

  // LEER STRING
  readPreferenceString(String key) {
    return _prefs.getString(key);
  }

  // GUARDAR STRING
  savePreferenceString(String key, String value) {
    _prefs.setString(key, value);
  }

  // LEER BOOL
  readPreferenceBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // GUARDAR BOOL
  savePreferenceBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  // GUARDAR LISTA DE STRINGS
  saveListPreferenceString(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  // LEER LISTA DE STRINGS
  readListPreferenceString(String key) {
    return _prefs.getStringList(key);
  }
}
