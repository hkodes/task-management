import 'package:flutter/material.dart';

import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  Task? _selectedTask;
  Map<int, bool> _expandedStates = {};

  List<Task> get tasks => _tasks;
  Task? get selectedTask => _selectedTask;
  Map<int, bool> get expandedStates => _expandedStates;

  void addTask(Task task) {
    _tasks.add(task);
    _selectedTask = task;
    notifyListeners();
  }

  void removeTask(int index) {
    if (_tasks[index] == _selectedTask && _selectedTask!.isAdded) {
      _selectedTask = _tasks.isNotEmpty ? _tasks.first : null;
    }
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    setAllTasksToFalse();
    _tasks[index].isAdded = !_tasks[index].isAdded;
    notifyListeners();
  }

  void setAllTasksToFalse() {
    for (var task in _tasks) {
      task.isAdded = false;
    }
    notifyListeners();
  }

  void setExpandedState(int index, bool isExpanded) {
    _expandedStates[index] = isExpanded;
    notifyListeners();
  }
}
