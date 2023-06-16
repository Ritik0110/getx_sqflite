import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/db_controller.dart';
import 'package:getx_sqflite/model/todo_model.dart';
import 'package:getx_sqflite/view/widgets/custom_text_field.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, this.model,this.isEdit = false}) : super(key: key);
  TodoModel? model;
  bool isEdit;
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final ageController = TextEditingController();
  SQLController control = Get.find();
  @override
  Widget build(BuildContext context) {
    if (model != null) {
      isEdit = true;
      nameController.text = model!.name;
      mailController.text = model!.emailId;
      ageController.text = model!.age.toString();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? "Edit data Screen" : "Add Data Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: nameController,
                  labelText: "Name",
                  hintText: "Name",
                  validationText: "Please Enter name"),
              CustomTextFormField(
                  controller: mailController,
                  labelText: "Email Address",
                  hintText: "Email",
                  validationText: "Please Enter Email Address"),
              CustomTextFormField(
                  controller: ageController,
                  labelText: "Age",
                  hintText: "Age",
                  keyboardType: TextInputType.number,
                  validationText: "Please Enter Age"),
              MaterialButton(
                onPressed: () {
                  isEdit
                      ? control.updateData(
                          name: nameController.text,
                          mail: mailController.text,
                          age: int.parse(ageController.text),
                          id: model!.id)
                      : control.insertData(
                          name: nameController.text,
                          mail: mailController.text,
                          age: int.parse(ageController.text));
                },
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Colors.red,
                child: Text(
                  isEdit ? "Update Data" : "Add Data",
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ));
  }
}
