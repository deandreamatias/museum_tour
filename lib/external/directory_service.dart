import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

abstract class DirectoryService {
  Future<String> getPath();
}

@LazySingleton(as: DirectoryService)
class PathProviderService implements DirectoryService {
  @override
  Future<String> getPath() async {
    try {
      final Directory _directory = await getApplicationDocumentsDirectory();
      return _directory.path;
    } catch (e) {
      throw UnimplementedError('Error to get path directory: $e');
    }
  }
}
