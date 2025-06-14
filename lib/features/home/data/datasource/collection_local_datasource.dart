import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tesstt_task/core/error/exception.dart';
import 'package:tesstt_task/features/home/data/models/bottle_model.dart';


abstract class CollectionLocalDataSoruce {
  Future<List<BottleModel>> getCachedBottles();
  Future<void> cacheBottles(List<BottleModel> bottleModels);
}

const CACHED_BOTTLES = "CACHED_POSTS";

class CollectionLocalDataSoruceImpl implements CollectionLocalDataSoruce {
  final SharedPreferences sharedPreferences;

  CollectionLocalDataSoruceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheBottles(List<BottleModel> bottleModels) async {
    List postModelsToJson = bottleModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_BOTTLES, json.encode(postModelsToJson));
    
  }

  @override
  Future<List<BottleModel>> getCachedBottles() {
    final jsonString = sharedPreferences.getString(CACHED_BOTTLES);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<BottleModel> jsonToBottleModels = decodeJsonData
          .map<BottleModel>((jsonBottleModel) => BottleModel.fromJson(jsonBottleModel))
          .toList();
      return Future.value(jsonToBottleModels);
    } else {
      throw CacheMissException();
    }
  }
}