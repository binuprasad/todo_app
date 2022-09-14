import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app1/model/data_model.dart';

class TodoController extends GetxController {
  List<TodoModel> todoList = [];

  @override
  void onInit() {
    getAllNotes();
    log('List Created');

    super.onInit();
    update();
  }

  Future<void> addNote(TodoModel value) async {
    final tudoDB = await Hive.openBox<TodoModel>('todu_db');

    tudoDB.add(value);
    todoList.add(value);
    getAllNotes();
    update();
  }

  getAllNotes() async {
      log('List Created.....');
  
    final tudoDB = await Hive.openBox<TodoModel>('todu_db');
      log('List Created.....2');

    todoList.clear();
    todoList.addAll(tudoDB.values);

    update();
  }

  Future<void> deleteNote(int id) async {
    final tudoDB = await Hive.openBox<TodoModel>('todu_db');
    await tudoDB.deleteAt(id);
    getAllNotes();
    update();
  }

  Future<void> upDate(int id, TodoModel value) async {
    final tudoDB = await Hive.openBox<TodoModel>('todu_db');
    tudoDB.putAt(id, value);
    getAllNotes();
    update();
  }
}
