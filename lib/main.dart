import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/todo_provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());

  await Hive.openBox<Todo>('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TodoProvider())],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xAA3C3C3C),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Oswald",
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
            // !Hint Text
            hintStyle: TextStyle(color: Colors.grey),

            // !Focused Border
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            // !Enabled Border
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white, // Cursor
            selectionColor: Colors.grey, // Highlight background
            selectionHandleColor: Colors.white, // Drag handle
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
