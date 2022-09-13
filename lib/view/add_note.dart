import 'package:flutter/material.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/home.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Add Note'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              maxLines: 1,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionController,
              maxLength: 100,
              maxLines: 5,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  addTodoList();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenHome()));
                },
                child: const Text('save'))
          ],
        ),
      ),
    );
  }

  Future<void> addTodoList() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    if (title.isEmpty || description.isEmpty) {
      return;
    }
    final todomodel = TodoModel(title: title, discription: description);

    addNote(todomodel);
  }
}
