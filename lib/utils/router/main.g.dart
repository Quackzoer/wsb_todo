// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeScreenRoute,
      $addTodoRoute,
      $taskRoute,
    ];

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/',
      name: 'Home',
      factory: $HomeScreenRouteExtension._fromState,
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addTodoRoute => GoRouteData.$route(
      path: '/add',
      name: 'Add Todo',
      factory: $AddTodoRouteExtension._fromState,
    );

extension $AddTodoRouteExtension on AddTodoRoute {
  static AddTodoRoute _fromState(GoRouterState state) => AddTodoRoute();

  String get location => GoRouteData.$location(
        '/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $taskRoute => GoRouteData.$route(
      path: '/task/:id',
      name: 'Task',
      factory: $TaskRouteExtension._fromState,
    );

extension $TaskRouteExtension on TaskRoute {
  static TaskRoute _fromState(GoRouterState state) => TaskRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/task/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
