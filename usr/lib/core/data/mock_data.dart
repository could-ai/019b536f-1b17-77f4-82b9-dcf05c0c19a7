import 'package:flutter/material.dart';

enum TaskStatus { todo, inProgress, done }
enum TaskPriority { low, medium, high }

class Task {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;
  final TaskPriority priority;
  final DateTime? dueDate;
  final String? assigneeAvatar;
  final List<String> tags;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    this.dueDate,
    this.assigneeAvatar,
    this.tags = const [],
  });
}

class PrayerTime {
  final String name;
  final String time;
  final bool isNext;

  PrayerTime({required this.name, required this.time, this.isNext = false});
}

class MockData {
  static List<PrayerTime> prayerTimes = [
    PrayerTime(name: 'Fajr', time: '05:12 AM'),
    PrayerTime(name: 'Dhuhr', time: '12:30 PM'),
    PrayerTime(name: 'Asr', time: '03:45 PM', isNext: true),
    PrayerTime(name: 'Maghrib', time: '06:15 PM'),
    PrayerTime(name: 'Isha', time: '07:45 PM'),
  ];

  static List<Task> tasks = [
    Task(
      id: '1',
      title: 'Design Home Screen',
      description: 'Create the dashboard with prayer widgets',
      status: TaskStatus.inProgress,
      priority: TaskPriority.high,
      dueDate: DateTime.now().add(const Duration(days: 1)),
      tags: ['Design', 'Mobile'],
    ),
    Task(
      id: '2',
      title: 'Integrate API',
      description: 'Connect to Supabase backend',
      status: TaskStatus.todo,
      priority: TaskPriority.medium,
      dueDate: DateTime.now().add(const Duration(days: 2)),
      tags: ['Backend', 'Dev'],
    ),
    Task(
      id: '3',
      title: 'User Research',
      description: 'Interview potential users about habits',
      status: TaskStatus.done,
      priority: TaskPriority.low,
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['Research'],
    ),
    Task(
      id: '4',
      title: 'Fix Navigation Bug',
      description: 'Sidebar not showing on iPad',
      status: TaskStatus.todo,
      priority: TaskPriority.high,
      tags: ['Bug', 'Urgent'],
    ),
  ];
}
