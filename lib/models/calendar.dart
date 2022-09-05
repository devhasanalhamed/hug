class CalendarElement {
  final String id;
  final String description;
  final DateTime date;

  CalendarElement({
    required this.id,
    required this.description,
    required this.date,
  });
}

class Calendar{
  final String id;
  final String year;
  final List semester1;
  final List semester2;

  Calendar({
    required this.id,
    required this.year,
    required this.semester1,
    required this.semester2,
  });
}