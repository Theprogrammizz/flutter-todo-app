import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/todo_provider.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();

  void openDialog(TodoProvider value) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          titleController: titleController,
          desController: desController,
          onSave: () {
            if (titleController.text.isNotEmpty &&
                desController.text.isNotEmpty) {
              value.addTask(titleController.text, desController.text);

              titleController.clear();
              desController.clear();
            }

            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xAA3C3C3C),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog(value);
          },
          backgroundColor: Colors.grey,
          child: Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(title: Text("TodoApp"), centerTitle: true),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 10.0),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, User",
                      style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Complete your tasks",
                      style: TextStyle(
                        fontFamily: "Oswald",
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.todoList.length,
                  itemBuilder: (context, index) {
                    final todo = value.todoList[index];

                    return TodoTile(
                      todoTitle: todo.title,
                      todoDesc: todo.description,
                      isChecked: todo.isCompleted,
                      onToggle: () {
                        value.toggleTask(index);
                      },
                      onDelete: () {
                        value.removeTask(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
