import 'package:hive/hive.dart';
import '../models/task.dart';

class LocalStorageService {
  static const String taskBoxName = 'tasks';
  static Box<Task>? _taskBox;

  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    }
    _taskBox = await Hive.openBox<Task>(taskBoxName);
  }

  static List<Task> loadTasks() {
    return _taskBox?.values.toList() ?? [];
  }

  static Future<void> addTask(Task task) async {
    await _taskBox?.put(task.id, task);
  }

  static Future<void> updateTask(Task task) async {
    await _taskBox?.put(task.id, task);
  }

  static Future<void> deleteTask(String id) async {
    await _taskBox?.delete(id);
  }
}
