import 'package:get/get.dart';

import 'package:todo_app1/controller/db_functions.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
  Get.put(TodoController());
  }

}