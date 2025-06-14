import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:tesstt_task/core/error/exception.dart';
import 'package:tesstt_task/features/home/data/models/bottle_model.dart';

abstract class CollectionRemoteDataSource{
  Future<List<BottleModel>> getColletions();
}

class CollectionRemoteDataSourceImpl extends CollectionRemoteDataSource{
  @override
  Future<List<BottleModel>> getColletions() async{
     try {
      final jsonString = await rootBundle.loadString('assets/mock/collection.json');
      final List<dynamic> jsonList = json.decode(jsonString);

      final bottles = jsonList.map((json) => BottleModel.fromJson(json)).toList();

      return bottles;
    } catch (e) {
       print('Error loading JSON: $e');
      throw ServerException();
    }
  }
}