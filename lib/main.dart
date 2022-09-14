import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';


import 'package:todo_app1/view/home.dart';

import 'model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TodoModelAdapter().typeId)) {
    Hive.registerAdapter(TodoModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: HomeBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}
