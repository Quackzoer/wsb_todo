import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wsb_todo/collections/todo.dart';
import 'package:wsb_todo/utils/database/database.dart';
import 'package:wsb_todo/utils/router/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const name = "Home";
  static const path = "/";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTodos();
      // _getTags();
    });
  }

  _getTodos() async {
    todos = await isarInstance.todos.where().findAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do App"),
      ),
      body: todos.isEmpty
          ? const Center(
              child: Text("No todos found"),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(todos[index].task ?? ""),
                    subtitle: Text(todos[index].description ?? ""),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTodoRoute().go(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
