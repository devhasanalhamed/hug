
class DegreesModel {
  final String name;
  final Map<String,String> degrees;
  final int sheetOrder;

  DegreesModel({
    required this.name,
    required this.degrees,
    required this.sheetOrder,
  });
}

class Subjects {
  final String subId;
  final String subName;
  final String subHours;
  final String subDegree;
  final String subPoints;
  final String subGradeName;
  Subjects({
    required this.subId,
    required this.subName,
    required this.subHours,
    required this.subDegree,
    required this.subPoints,
    required this.subGradeName,
  });
}
class SemesterDegree{
  final String semesterName;
  final String semesterAvg;
  final List<Subjects> subjects;

  SemesterDegree({
    required this.semesterName,
    required this.semesterAvg,
    required this.subjects,
  });
}

class DegreeModel {
  final String levelName;
  final List<SemesterDegree> semesterModel;
  final int levelOrder;

  DegreeModel({
    required this.levelName,
    required this.semesterModel,
    required this.levelOrder,
  });
}