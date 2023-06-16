import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/view/widgets/todo_item.dart';

import '../../controller/db_controller.dart';
import 'editscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => EditScreen(), transition: Transition.downToUp);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<SQLController>(builder: (controller) {
          return ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return TodoItem(controller: controller, index: index);
              });
        }));
  }
}
