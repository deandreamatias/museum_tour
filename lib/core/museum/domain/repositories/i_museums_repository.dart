import '../models/museum.dart';
import '../models/museums.dart';

abstract class IMuseumsRepository {
  Future<Museums> getMuseums();
  Future<Museum> getMuseum();
}
