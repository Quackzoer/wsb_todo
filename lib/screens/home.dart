import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wsb_todo/collections/todo.dart';
import 'package:wsb_todo/utils/database/database.dart';

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
    return Container();
  }
}
