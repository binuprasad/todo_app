
import 'package:flutter/material.dart';

import 'package:todo_app1/model/data_model.dart';
import 'package:todo_app1/view/edit_screen.dart';

class ScreenView extends StatelessWidget {
  TodoModel data;
  int index;
  ScreenView({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  final _description = TextEditingController();
  final _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _title.text = data.title.toString();
    _description.text = data.discription.toString();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit Screen'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenEdit(data: data, index: index,)));
            }, icon: const Icon(Icons.edit,color: Colors.white,))
          ],
        ),
        body: Column(
          children: [
            TextField(
              readOnly: true,
              controller: _title,
              decoration: const InputDecoration(
                  enabled: false, border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10, ),
            TextFormField(
              maxLines: 5,
              enabled: false,
              readOnly: true,
              controller: _description,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
