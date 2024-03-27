import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class Todo{
  Id id = Isar.autoIncrement;
  String? task;
  String? description;
  bool done = false;
  @enumerated
  late Priority priority;
}

enum Priority{
  high,
  medium,
  low
}