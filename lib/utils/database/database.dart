import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wsb_todo/collections/todo.dart';

late Isar isarInstance;

Future<void> initializeIsarCore() async {
  final dir = await getApplicationDocumentsDirectory();
  isarInstance = await Isar.open(
    [TodoSchema],
    directory: dir.path,
  );
}