
import 'package:courier_management_system/core/utils/routes/routes_name.dart';
import 'package:courier_management_system/ui/view/add_todoView.dart';
import 'package:courier_management_system/ui/view/todo_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../ui/view/splashView.dart';





class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
      case RoutesName.todoList:
        return MaterialPageRoute(
            builder: (BuildContext context) => ToDoListView());
      case RoutesName.addTodo:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddTodoView());
      default:
       return MaterialPageRoute(builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }


}