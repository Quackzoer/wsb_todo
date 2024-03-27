import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wsb_todo/screens/home.dart';
import 'package:wsb_todo/screens/add_todo.dart';
import 'package:wsb_todo/screens/task.dart';

part 'main.g.dart';

GoRouter router = GoRouter(routes: $appRoutes);

@TypedGoRoute<HomeScreenRoute>(
  path: HomeScreen.path,
  name: HomeScreen.name
)
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<AddTodoRoute>(
  path: AddTodoScreen.path,
  name: AddTodoScreen.name,
)
@immutable
class AddTodoRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddTodoScreen();
  }
}

@TypedGoRoute<TaskRoute>(
  path: TaskScreen.path,
  name: TaskScreen.name,
)

@immutable
class TaskRoute extends GoRouteData {
  final int id;

  const TaskRoute({
    required this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TaskScreen(id: id);
  }
}


