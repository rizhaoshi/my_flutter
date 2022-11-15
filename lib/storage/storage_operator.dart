import 'dart:async';

/// 通用操作接口
abstract class StorageOperator {
  Future<void> set(String key, dynamic value);

  Future<String?> get(String key);

  Future<void> setBool(String key, bool value);

  Future<bool?> getBool(String key);

  Future<void> setString(String key, String value);

  Future<String?> getString(String key);

  Future<void> setInt(String key, int value);

  Future<int?> getInt(String key);

  Future<void> setDouble(String key, double value);

  Future<double?> getDouble(String key);

  Future<void> setLong(String key, int value);

  Future<int?> getLong(String key);

  Future<void> clear();
}
