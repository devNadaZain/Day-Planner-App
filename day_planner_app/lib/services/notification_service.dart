import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../models/task.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;

    try {
      // Initialize timezone data
      tz.initializeTimeZones();

      // Set local timezone
      if (!kIsWeb) {
        tz.setLocalLocation(
          tz.getLocation('America/New_York'),
        ); // Default timezone
      }

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      await _notificationsPlugin.initialize(initializationSettings);

      _isInitialized = true;
    } catch (e) {
      print('Notification service initialization error: $e');
      // Continue without notifications if initialization fails
    }
  }

  static Future<void> scheduleNotification(Task task) async {
    if (task.reminderDateTime == null || kIsWeb) return;

    try {
      if (!_isInitialized) {
        await init();
      }

      final androidDetails = AndroidNotificationDetails(
        'task_reminder_channel',
        'Task Reminders',
        channelDescription: 'Reminders for your tasks',
        importance: Importance.max,
        priority: Priority.high,
      );

      final details = NotificationDetails(android: androidDetails);

      // Use the reminder date time directly without timezone conversion for web
      final scheduledDate = task.reminderDateTime!;

      await _notificationsPlugin.zonedSchedule(
        task.id.hashCode,
        'Task Reminder',
        task.title,
        tz.TZDateTime.from(scheduledDate, tz.local),
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    } catch (e) {
      print('Error scheduling notification: $e');
      // Continue without notification if scheduling fails
    }
  }

  static Future<void> cancelNotification(String taskId) async {
    if (kIsWeb) return;

    try {
      await _notificationsPlugin.cancel(taskId.hashCode);
    } catch (e) {
      print('Error canceling notification: $e');
    }
  }

  static Future<void> updateNotification(Task task) async {
    if (kIsWeb) return;

    try {
      await cancelNotification(task.id);
      await scheduleNotification(task);
    } catch (e) {
      print('Error updating notification: $e');
    }
  }
}
