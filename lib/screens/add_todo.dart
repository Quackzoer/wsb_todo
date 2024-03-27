import 'package:flutter/material.dart';
import 'package:wsb_todo/utils/router/main.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});
  static const name = "Add Todo";
  static const path = "/add";
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do App"),
        leading: BackButton(
          onPressed: (){
            HomeScreenRoute().go(context);
          },
        )
      ),
      body: const Center(
        child: Text("Add To Do"),
      ),
    );
  }
}
