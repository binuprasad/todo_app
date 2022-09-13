// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app1/model/data_model.dart';

ValueNotifier<List<TodoModel>> todoList = ValueNotifier([]);
Future<void> addNote(TodoModel value) async {
  final tudoDB = await Hive.openBox<TodoModel>('todu_db');
  tudoDB.add(value);
  todoList.value.add(value);
  todoList.notifyListeners();
  
}

Future<void> getAllNotes() async {
  final tudoDB = await Hive.openBox<TodoModel>('todu_db');
  todoList.value.clear();
  todoList.value.addAll(tudoDB.values);
  todoList.notifyListeners();
}

Future<void> deleteNote(int id) async {
  final tudoDB = await Hive.openBox<TodoModel>('todu_db');
  await tudoDB.deleteAt(id);
  getAllNotes();
}

Future<void> upDate(int id, TodoModel value) async {
  final tudoDB = await Hive.openBox<TodoModel>('todu_db');
  tudoDB.putAt(id, value);
  getAllNotes();
}
