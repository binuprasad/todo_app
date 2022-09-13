import 'package:flutter/material.dart';
import 'package:todo_app1/controller/db_functions.dart';
import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/home.dart';

// ignore: must_be_immutable
class ScreenEdit extends StatelessWidget {
  TodoModel data;
  int index;
  ScreenEdit({Key? key, required this.data, required this.index})
      : super(key: key);
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = data.title.toString();
    _descriptionController.text = data.discription.toString();
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
              controller: _titleController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 5,
              controller: _descriptionController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
               updation(index);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ScreenHome()));
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
  updation(index){
    final title=_titleController.text.trim();
    final description = _descriptionController.text.trim();
    final datas = TodoModel(title: title, discription: description);
    upDate(index, datas);
  }
}
 