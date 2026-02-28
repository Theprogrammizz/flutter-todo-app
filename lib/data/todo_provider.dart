import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final Box<Todo> todoBox = Hive.box<Todo>('todoBox');

List<Todo> get todoList => todoBox.values.toList();

  void addTask(String title, String description) {
  todoBox.add(
    Todo(title: title, description: description),
  );
  notifyListeners();
}

  void removeTask(int index) {
  todoBox.deleteAt(index);
  notifyListeners();
}

  void toggleTask(int index) {
  final todo = todoBox.getAt(index);
  if (todo != null) {
    todo.isCompleted = !todo.isCompleted;
    todo.save(); // IMPORTANT
    notifyListeners();
  }
}
}
