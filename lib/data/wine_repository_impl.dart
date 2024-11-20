import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/wine.dart';
import '../domain/wine_repository.dart';

class WineRepositoryImpl implements WineRepository {
  @override
  Future<List<Wine>> fetchWines() async {
    final String response = await rootBundle.loadString('assets/data/wines.json');
    final List<dynamic> data = json.decode(response);
    return data.map((e) => Wine(
      title: e['title'],
      imageAsset: e['imageAsset'],
      price: e['price'],
      criticsScore: e['criticsScore'],
      isAvailable: e['isAvailable'],
      isAdded: e['isAdded'],
    )).toList();
  }
}
