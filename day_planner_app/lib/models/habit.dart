class Habit {
  final String id;
  final String name;
  final List<DateTime> completedDates;

  Habit({required this.id, required this.name, this.completedDates = const []});
}
