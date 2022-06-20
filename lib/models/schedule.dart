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
  final int startTime;
  final int endTime;
  final String startTimeSym;
  final String endTimeSym;
  final String className;
  final Days dayName;

  ScheduleElement(
      this.subjectName,
      this.teacherName,
      this.startTime,
      this.startTimeSym,
      this.endTime,
      this.endTimeSym,
      this.className,
      this.dayName,
      );
}