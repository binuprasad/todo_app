import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/view/home.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  
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
              
              controller:myController. titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller:myController. descriptionController,
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
                myController.  addTodoList();
                  Get.to(ScreenHome());
                 
                },
                child: const Text('save'))
          ],
        ),
      ),
    );
  }

 
}
