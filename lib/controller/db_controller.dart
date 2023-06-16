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

  final updatetext = TextEditingController();
  Database? db;
  List<TodoModel> list = [];
  void createDatabase() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath, "todo1.db");
    OpenAppDatabase(path: path);
  }

  void OpenAppDatabase({required String path}) async {
    Database database = await openDatabase(path,
        onOpen: (database) {
          db = database;
          debugPrint("Database Opened");
        },
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isDone INTEGER)");
          debugPrint("Database Created");
        });
    debugPrint(database.toString());
  }

  void deleteTheDatabase() async {
    var bdpath = await getDatabasesPath();
    String path = join(bdpath, "todo1.db");
    await deleteDatabase(path);
    debugPrint("Database Deleted");
  }

  void InsertData() async{
    var insert =await db?.insert("todo",
        {"title": "1st data", "description": "1st description", "isDone": 0});
    debugPrint("$insert Data Inserted");
    GetData();
  }

  void UpdateData() async{
    var updatedata =await db?.update("todo", {
      "title":"2nd data",
      "description":"2nd description",
      "isDone":3
    }, where: "id = ${updatetext.text}");
    debugPrint("$updatedata Data Updated");
    GetData();
  }
  void DeleteData() async{
    var deletetext =await db?.delete("todo",where: "id = ${updatetext.text}");
    debugPrint("$deletetext Data Deleted");
    GetData();
  }
  void GetData() async{
    var all_data = await db?.query("todo");
    list.clear();
    for(var i in all_data!){
      print(i);
      list.add(TodoModel.fromJson(i));
    }
    print(all_data);
    print(list.length);
    update();
  }
}
