import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/tasks/presentation/widgets/addtask_Screen.dart';

import 'features/tasks/presentation/task_Screen.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home:  TaskScreen(),       

    );
  }
}

  
 