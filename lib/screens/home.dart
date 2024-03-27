import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wsb_todo/collections/todo.dart';
import 'package:wsb_todo/utils/capitalize.dart';
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
                  Todo todo = todos[index];
                  return Container(
                    color: index.isEven ? Colors.grey[200] : Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todo.task ?? ""),
                            Text(
                              capitalize(
                                todo.priority.toString().split(".").last,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                isarInstance.writeTxn(() async {
                                  todo.done = !todo.done;
                                  await isarInstance.todos.put(todo);
                                }).then(
                                  (value) {
                                    _getTodos();
                                  },
                                );
                                setState(() {});
                              },
                              icon: Icon(todo.done
                                  ? Icons.check
                                  : Icons.square_outlined),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                TaskRoute(id: todo.id).go(context);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        )
                      ],
                    ),
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
