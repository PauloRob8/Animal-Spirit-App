import 'dart:convert';

import 'package:animal_spirit_app/model/animal.dart';
import 'package:flutter/services.dart';

class FakeDataRepository {
  Future<List<Animal>> getallAnimals() async {
    var json = await rootBundle.loadString('lib/data/animals_data.json');
    var parsed = jsonDecode(json.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Animal>((json) => Animal.fromJson(json)).toList();
  }
}
