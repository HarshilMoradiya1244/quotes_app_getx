import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';

class JsonHelper{
  Future<List<QuotesModel>> dataToList() async {
    var jsonString = await rootBundle.loadString("assets/json/quotes.json");
    List quotes = jsonDecode(jsonString);
    List<QuotesModel> modelList =
    quotes.map((e) => QuotesModel.mapToModel(e)).toList();
    return modelList;
  }
}