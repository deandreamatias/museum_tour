import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'directory_service.dart';

abstract class LocalStorageService {
  LocalStorageService(this.directoryRepository);

  final DirectoryService directoryRepository;

  Future<bool> init();

  Future<bool> config({required String box});

  T? getData<T>(String key);

  Future<bool> saveData<T>(String key, T value);

  void clearAllData();
}

@lazySingleton
class HiveService implements LocalStorageService {
  HiveService(this.directoryRepository);

  final DirectoryService directoryRepository;
  late Box _box;
  bool _isInitiated = false;

  /// If service is initiated and configured, can use service
  bool get canUseService => _isInitiated && _box.isOpen;

  @override

  /// Init local storage with [directoryRepository] path
  Future<bool> init() async {
    try {
      final String path = await directoryRepository.getPath();
      Hive.init(path);
      _isInitiated = true;
    } catch (e) {
      debugPrint('Error to init box: $e');
      _isInitiated = false;
    }
    return _isInitiated;
  }

  @override

  /// Config one box to local storage, with [box] name
  Future<bool> config({required String box}) async {
    try {
      _box = await Hive.openBox<String>(box);
      return _box.isOpen;
    } catch (e) {
      throw UnimplementedError('Error to config box: $e');
    }
  }

  @override

  /// Get data with [key] from local storage
  T? getData<T>(String key) {
    try {
      return _box.get(key);
    } catch (e) {
      throw UnimplementedError('Error to get data: $e');
    }
  }

  @override

  /// Save data [key] with [value] in local storage
  Future<bool> saveData<T>(String key, T value) async {
    try {
      await _box.put(key, value);
      return true;
    } catch (e) {
      throw UnimplementedError('Error to save data: $e');
    }
  }

  @override

  /// Deletes all open boxes
  Future<void> clearAllData() async {
    await Hive.deleteFromDisk();
  }
}
