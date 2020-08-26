import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'directory_service.dart';

abstract class DatabaseService {
  DatabaseService(this.directoryRepository);

  final DirectoryService directoryRepository;

  Future<bool> initPrefs();

  Future<bool> configPrefs({String box});

  T getPrefs<T>(String key);

  Future<bool> savePrefs<T>(String key, T value);
}

@lazySingleton
class HiveService implements DatabaseService {
  HiveService(this.directoryRepository);

  final PathProviderService directoryRepository;
  Box _box;

  @override
  Future<bool> initPrefs() async {
    try {
      final String path = await directoryRepository.getPath();
      Hive.init(path);
      return true;
    } catch (e) {
      debugPrint('Error to init box: $e');
      return false;
    }
  }

  @override
  Future<bool> configPrefs({String box}) async {
    try {
      _box = await Hive.openBox(box);
      return true;
    } catch (e) {
      debugPrint('Error to config box: $e');
      return false;
    }
  }

  @override
  T getPrefs<T>(String key) {
    return _box.get(key) as T;
  }

  @override
  Future<bool> savePrefs<T>(String key, T value) async {
    try {
      await _box.put(key, value);
      return true;
    } catch (e) {
      throw UnimplementedError('Error to save prefs: $e');
    }
  }
}
