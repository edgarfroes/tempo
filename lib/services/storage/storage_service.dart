import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> save<T>(String key, T data);
  Future<T?> get<T>(String key);
  Future<void> remove(String key);
}

class StorageServiceImpl extends StorageService {
  late final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  @override
  Future<void> save<T>(String key, T data) async {
    if (data is int) {
      await _prefs.setInt(key, data);
      return;
    }

    if (data is double) {
      await _prefs.setDouble(key, data);
      return;
    }

    if (data is String) {
      await _prefs.setString(key, data);
      return;
    }

    if (data is bool) {
      await _prefs.setBool(key, data);
      return;
    }

    throw UnsupportedError('Unsupported data type');
  }

  @override
  Future<T?> get<T>(String key) async {
    if (T == int) {
      return await _prefs.getInt(key) as T?;
    }

    if (T == double) {
      return await _prefs.getDouble(key) as T?;
    }

    if (T == String) {
      return await _prefs.getString(key) as T?;
    }

    if (T == bool) {
      return await _prefs.getBool(key) as T?;
    }

    throw UnsupportedError('Unsupported data type');
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
