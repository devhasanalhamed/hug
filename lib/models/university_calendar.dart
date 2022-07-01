enum Semester {
  first,
  second,
}

class UniversityCalendarElement {
  final String description;
  final DateTime date;
  final Semester semester;

  UniversityCalendarElement(
      this.description,
      this.date,
      this.semester,
      );
}