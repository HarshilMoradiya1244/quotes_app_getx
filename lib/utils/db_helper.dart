import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:quotes_app_getx/model/quotes_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  Database? dataBase;
  // ignore: non_constant_identifier_names
  final String DB_NAME = "data.db";

  Future<Database> checkDb() async {
    if (dataBase != null) {
      return dataBase!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String incomeTable =
          "CREATE TABLE quotes(id INTEGER PRIMARY KEY AUTOINCREMENT, quotes TEXT, category TEXT,author TEXT)";
      String categoryTable =
          "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT, category TEXT,author TEXT)";
      db.execute(incomeTable);
      db.execute(categoryTable);
    });
  }

    Future<void> insertData(QuotesModel quotesModel) async {
      dataBase = await checkDb();
      dataBase!.insert("quotes", {
        "category":quotesModel.category,
        "qoutesList":quotesModel.qoutesList,
        "authorList":quotesModel.authorList,
      });
    }

}