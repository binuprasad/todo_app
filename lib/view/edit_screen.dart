import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/home.dart';

// ignore: must_be_immutable
class ScreenEdit extends StatelessWidget {
  TodoModel? data;
  int? index;
  ScreenEdit({Key? key, this.data, this.index}) : super(key: key);
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final TodoController myController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    titleController.text = data!.title.toString();
    descriptionController.text = data!.discription.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Screen'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 5,
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  updation(index);
                  Get.off(ScreenHome());
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  updation(index) {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final datas = TodoModel(title: title, discription: description);
    myController.upDate(index, datas);
  }
}
