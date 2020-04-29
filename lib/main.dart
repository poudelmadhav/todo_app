import 'package:flutter/material.dart';
import 'package:todo_app/util/db_helper.dart';
import 'package:todo_app/model/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Todo> todos = List<Todo>();
    DbHelper helper = DbHelper();

    helper.initializeDb().then(
      (result) => helper.getTodos().then((result) => todos = result));

    DateTime today = DateTime.now();

    Todo todo = Todo("Buy Apples", 1, today.toString(), "Maker sure they are good");
    var result = helper.insertTodo(todo);
    
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo APp'),
      ),
      body: Center(
        child: Text('Todo app'),
      ),
    );
  }
}
