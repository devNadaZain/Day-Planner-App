import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      appBar: AppBar(title: const Text('Day Planner'), centerTitle: true),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'No tasks yet! Tap + to add your first task.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Icon(Icons.inbox, size: 48, color: Colors.indigo),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  color: task.isCompleted ? Colors.indigo[100] : Colors.white,
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (_) => taskProvider.toggleTask(task.id),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${task.description}\n${_formatTime(task.dateTime)}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Task'),
                            content: const Text(
                              'Are you sure you want to delete this task?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true) {
                          await taskProvider.deleteTask(task.id);
                        }
                      },
                    ),
                    onTap: () => _showEditTaskDialog(context, task),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    DateTime? selectedTime;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Task'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          selectedTime == null
                              ? 'No time chosen'
                              : _formatTime(selectedTime!),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(now),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  picked.hour,
                                  picked.minute,
                                );
                              });
                            }
                          },
                          child: const Text('Pick Time'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        selectedTime != null) {
                      final task = Task(
                        id: const Uuid().v4(),
                        title: titleController.text,
                        description: descController.text,
                        dateTime: selectedTime!,
                      );
                      Provider.of<TaskProvider>(
                        context,
                        listen: false,
                      ).addTask(task);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, Task task) {
    final titleController = TextEditingController(text: task.title);
    final descController = TextEditingController(text: task.description);
    DateTime selectedTime = task.dateTime;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Task'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(_formatTime(selectedTime)),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(selectedTime),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  picked.hour,
                                  picked.minute,
                                );
                              });
                            }
                          },
                          child: const Text('Pick Time'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.isNotEmpty) {
                      final updatedTask = Task(
                        id: task.id,
                        title: titleController.text,
                        description: descController.text,
                        dateTime: selectedTime,
                        isCompleted: task.isCompleted,
                      );
                      await Provider.of<TaskProvider>(
                        context,
                        listen: false,
                      ).updateTask(updatedTask);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
