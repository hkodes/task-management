import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/providers/task_provider.dart';
import 'package:task_management/screens/task_list_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task Manager',
        home: TaskListPage(),
      ),
    ),
  );
}
