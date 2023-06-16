import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/db_controller.dart';
import '../screens/editscreen.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.controller, required this.index})
      : super(key: key);
  final SQLController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(controller.list[index].id.toString()),
              Text(controller.list[index].name),
              Text(controller.list[index].emailId),
              Text(controller.list[index].age.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.deleteData(id: controller.list[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 18,
                      )),
                  IconButton(
                      onPressed: () {
                        Get.to(() => EditScreen(
                              model: controller.list[index],
                              isEdit: true,
                            ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 18,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
