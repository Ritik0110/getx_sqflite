import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    createDatabase();
  }

  void createDatabase() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath, "todo.db");
    OpenAppDatabase(path: path);
  }

  void OpenAppDatabase({required String path}) async {
    Database database = await openDatabase(path,
        onOpen: (database) {
          debugPrint("Database Opened");
        },
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isDone INTEGER)");
          debugPrint("Database Created");
        });
  }

  void deleteTheDatabase() async {
    var bdpath = await getDatabasesPath();
    String path = join(bdpath, "todo.db");
    await deleteDatabase(path);
    debugPrint("Database Deleted");
  }

  void InsertData() {}
  void UpdateData() {}
  void DeleteData() {}
  void GetData() {}
}
