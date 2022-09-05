enum Days {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
}
class ScheduleElement {
  final String subjectName;
  final String teacherName;
  final String startTime;
  final String endTime;
  final String startTimeSym;
  final String endTimeSym;
  final String className;
  final Days dayName;

  ScheduleElement({
    required this.subjectName,
    required this.teacherName,
    required this.startTime,
    required this.startTimeSym,
    required this.endTime,
    required this.endTimeSym,
    required this.className,
    required this.dayName,
  });
}