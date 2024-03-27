import 'package:flutter/material.dart';
import 'package:wsb_todo/collections/todo.dart';
import 'package:wsb_todo/utils/capitalize.dart';
import 'package:wsb_todo/utils/database/database.dart';
import 'package:wsb_todo/utils/router/main.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required this.id});
  static const name = "Task";
  static const path = "/task/:id";
  final int id;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Todo? todo;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTodo();
      // _getTags();
    });
  }

  _getTodo() async {
    todo = await isarInstance.todos.get(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do App"),
        leading: BackButton(
          onPressed: () {
            HomeScreenRoute().go(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(todo?.task ?? ""),
                Icon(todo!.done ? Icons.check : Icons.square_outlined),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Priority: ${capitalize(todo?.priority.toString().split(".").last ?? "")}",
            ),
            const SizedBox(height: 20),
            const Text("Description:"),
            Text(todo?.description ?? ""),
          ],
        ),
      ),
    );
  }
}
