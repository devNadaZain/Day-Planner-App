import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> loadTasks() async {
    _tasks.clear();
    _tasks.addAll(LocalStorageService.loadTasks());
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await LocalStorageService.addTask(task);
    notifyListeners();
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      await LocalStorageService.updateTask(updatedTask);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await LocalStorageService.deleteTask(id);
    notifyListeners();
  }

  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final task = _tasks[index];
      final updatedTask = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        dateTime: task.dateTime,
        isCompleted: !task.isCompleted,
      );
      _tasks[index] = updatedTask;
      await LocalStorageService.updateTask(updatedTask);
      notifyListeners();
    }
  }
}
