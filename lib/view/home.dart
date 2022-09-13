import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/add_note.dart';
import 'package:todo_app1/view/view_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  final appcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    getAllNotes();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text('Todo App'),
          backgroundColor: appcolor,
        ),
        body: ValueListenableBuilder(
          valueListenable: todoList,
          builder: (BuildContext ctx, List<TodoModel> value, Widget? child) {
            return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final data = value[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Get.to(ScreenView(data: data, index: index));
                      },
                      title: Text(data.title),
                      subtitle: Text(
                        data.discription,
                        maxLines: 1,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                title: 'Delete Note?',
                                content: const Text(
                                    'Are you sure to delete this note '),
                                confirm: TextButton(
                                    onPressed: () {
                                      Get.back();
                                      deleteNote(index);
                                    },
                                    child: const Text('Yes')),
                                cancel: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('No')));
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                });
          },
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.to(AddNote());
            },
            label: const Text('AddNote')));
  }
}
