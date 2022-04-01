import 'dart:convert';

import 'package:animal_spirit_app/model/animal.dart';
import 'package:flutter/services.dart';

/// Class to obatain our fake data
///
class FakeDataRepository {
  /// Get all animals from our local json file
  /// and convert in a list of the Animal Object
  Future<List<Animal>> getallAnimals() async {
    var json = await rootBundle.loadString('lib/data/animals_data.json');
    var parsed = jsonDecode(json.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Animal>((json) => Animal.fromJson(json)).toList();
  }
}
