import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/todo_model.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    createDatabase();
  }

  Database? db;
  List<TodoModel> list = [];


  void createDatabase() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath, "todo1.db");
    openAppDatabase(path: path);
  }

  void openAppDatabase({required String path}) async {
    await openDatabase(path,
        onOpen: (database) {
          db = database;
          debugPrint("Database Opened");
          getData();
        },
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, emailId TEXT, age INTEGER)");
          debugPrint("Database Created");
        });
  }

  void deleteTheDatabase() async {
    var bdPath = await getDatabasesPath();
    String path = join(bdPath, "todo1.db");
    await deleteDatabase(path);
    debugPrint("Database Deleted");
    getData();
  }

  void insertData(
      {required String name, required String mail, required int age}) async {
    try {
      var insert =
          await db?.insert("todo", {"name": name, "emailId": mail, "age": age});
      debugPrint("$insert Data Inserted");

      Get.back();
      getData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateData(
      {required String name,
      required String mail,
      required int age,
      required int id}) async {
    try {
      var updateData = await db?.update(
          "todo", {"name": name, "emailId": mail, "age": age},
          where: "id = $id");
      debugPrint("$updateData Data Updated");
      Get.back();
      getData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async {
    var deleteText = await db?.delete("todo", where: "id = $id");
    debugPrint("$deleteText Data Deleted");
    getData();
  }

  void getData() async {
    var allData = await db?.query("todo");
    list.clear();
    for (var i in allData!) {
      list.add(TodoModel.fromJson(i));
    }
    update();
  }
}
