import 'package:flutter/material.dart';
import 'package:wsb_todo/collections/todo.dart';
import 'package:wsb_todo/utils/database/database.dart';
import 'package:wsb_todo/utils/router/main.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});
  static const name = "Add Todo";
  static const path = "/add";
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

List<String> priorities = Priority.values.map((e) => e.toString()).toList();

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _priority = priorities[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("To-do App"),
          leading: BackButton(
            onPressed: () {
              HomeScreenRoute().go(context);
            },
          )),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _taskController,
                  decoration: const InputDecoration(
                    labelText: 'Task',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                    items: priorities.map((priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Row(
                          children: [
                            Text(priority),
                          ],
                        ),
                      );
                    }).toList(),
                    value: _priority,
                    onChanged: (newValue) {
                      setState(() {
                        _priority = newValue.toString();
                      });
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      Todo newTodo = Todo()
                        ..task = _taskController.text
                        ..description = _descriptionController.text
                        ..priority = Priority.values.firstWhere((element) =>
                            element.toString().split(".").last == _priority);
                      isarInstance.writeTxn(() async {
                        await isarInstance.todos.put(newTodo);
                      }).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Todo added successfully')),
                        );
                        HomeScreenRoute().go(context);
                      }).catchError((err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed to add todo')),
                        );
                      });
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
