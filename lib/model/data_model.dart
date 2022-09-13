
import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
 final String title;
 @HiveField(1)
 final String discription;
 @HiveField(3)
 int ?id;
  TodoModel({
    required this.title,
    required this.discription,
    this.id
  });
}
