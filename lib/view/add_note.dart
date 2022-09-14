import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/home.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final TodoController myController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              
              controller: titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              maxLength: 100,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder()),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black),
                onPressed: () {
                  addTodoList();
                  Get.to(ScreenHome());
                 
                },
                child: const Text('save'))
          ],
        ),
      ),
    );
  }

  Future<void> addTodoList() async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    if (title.isEmpty || description.isEmpty) {
      return;
    }
    final todomodel = TodoModel(title: title, discription: description);

    myController.addNote(todomodel);
  }
}
