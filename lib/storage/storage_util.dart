import 'package:mmkv_flutter/mmkv_flutter.dart';
import 'dart:convert';
import 'storage_operator.dart';

class StorageUtil implements StorageOperator {
  static final StorageUtil _instance = StorageUtil._internal();

  StorageUtil._internal();

  static StorageUtil get instance => _instance;

  static MmkvFlutter? _mmkv;

  Future<void> _setupMmkvIfNeeded() async {
    if (_mmkv != null) {
      return;
    }
    _mmkv = await MmkvFlutter.getInstance();
  }

  Future<MmkvFlutter?> get mmkv async {
    if (_mmkv != null) return _mmkv;

    _mmkv = await MmkvFlutter.getInstance();

    return _mmkv;
  }

  @override
  Future<void> set(String key, dynamic value) async {
    await _setupMmkvIfNeeded();

    if (value is String) {
      await _mmkv?.setString(key, value);
    } else {
      try {
        await _mmkv?.setString(key, json.encode(value));
      } catch (e) {}
    }
  }

  @override
  Future<String?> get(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getString(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _setupMmkvIfNeeded();

    await _mmkv?.setBool(key, value);
  }

  @override
  getBool(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getBool(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _setupMmkvIfNeeded();

    await _mmkv?.setString(key, value);
  }

  @override
  getString(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getString(key);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _setupMmkvIfNeeded();

    await _mmkv?.setDouble(key, value);
  }

  @override
  getDouble(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getDouble(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _setupMmkvIfNeeded();

    await _mmkv?.setInt(key, value);
  }

  @override
  getInt(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getInt(key);
  }

  @override
  Future<void> setLong(String key, int value) async {
    await _setupMmkvIfNeeded();

    await _mmkv?.setLong(key, value);
  }

  @override
  getLong(String key) async {
    await _setupMmkvIfNeeded();

    return await _mmkv?.getLong(key);
  }

  @override
  Future<void> clear() async {
    await _setupMmkvIfNeeded();

    await _mmkv?.clear();
  }
}
