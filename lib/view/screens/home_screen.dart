import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/db_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SQLController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.deleteTheDatabase();
              },
              icon: const Icon(
                Icons.remove,
                size: 20,
                color: Colors.white,
              )),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                controller.InsertData();
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        children: [

          TextField(
            controller: controller.updatetext,
          ),
          Center(
            child: TextButton(
                child: const Text("Update Data"),
                onPressed: () {
                  controller.UpdateData();
                }),
          ),
          Center(
            child: TextButton(
                child: const Text("delete Data"),
                onPressed: () {
                  controller.DeleteData();
                }),
          ),
        ],
      ),
    );
  }
}
