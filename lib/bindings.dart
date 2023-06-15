
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/db_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SQLController(),permanent: true);
  }

}