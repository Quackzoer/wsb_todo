import 'package:flutter/material.dart';
import 'package:wsb_todo/utils/database/database.dart';
import 'package:wsb_todo/utils/router/main.dart';


void main() async {
  await initializeIsarCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To-do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
