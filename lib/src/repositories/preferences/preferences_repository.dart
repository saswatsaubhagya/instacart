import 'package:shared_preferences/shared_preferences.dart';

typedef StringList = List<String>;

class PreferencesTypeException implements Exception {
  const PreferencesTypeException(this.reason);
  final String reason;

  @override
  String toString() => reason;
}

class Preferences {
  const Preferences({required SharedPreferences sharedPref})
      : _preferences = sharedPref;

  final SharedPreferences _preferences;

  T? getValue<T>(String key) {
    return _preferences.get(key) as T?;
  }

  Future<void> setValue<T>(String key, dynamic value) async {
    switch (T) {
      case bool:
        await _preferences.setBool(key, value as bool);
        return;
      case double:
        await _preferences.setDouble(key, value as double);
        return;
      case int:
        await _preferences.setInt(key, value as int);
        return;
      case String:
        await _preferences.setString(key, value == null ? "" : value as String);
        return;
      case StringList:
        await _preferences.setStringList(key, value as List<String>);
        return;
      default:
        throw PreferencesTypeException(
          '''
          You cannot store a value of type $T in preferences.
          Supported types are bool, double, int, String and List<String>
          ''',
        );
    }
  }
}
