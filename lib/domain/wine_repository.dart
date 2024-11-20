import 'wine.dart';

abstract class WineRepository {
  Future<List<Wine>> fetchWines();
}
