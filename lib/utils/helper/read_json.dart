import 'dart:convert';

import 'package:flutter/services.dart';

import '../../features/detection/models/plant_model.dart';

class ReadJson {
  static Future<List<PlantModel>?> readJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/model/model_tanaman.json');
      final jsonData = json.decode(jsonString);

      List<dynamic> tanamanData = jsonData;
      List<PlantModel> tempList = [];
      for (var item in tanamanData) {
        tempList.add(PlantModel.fromJson(item));
      }
      print(tempList);
      return tempList;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
