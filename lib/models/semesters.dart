


class Levels {
  final String levelName;
  final int firstSemesterNum;
  final int secondSemesterNum;
  final int levelValue;

  Levels (
      this.levelName,
      this.firstSemesterNum,
      this.secondSemesterNum,
      this.levelValue,
      );

}

class LevelsList {
  List<Levels> universityLevels = [
    Levels("المستوى الأول", 1, 2, 1),
    Levels("المستوى الثاني", 3, 4, 2),
    Levels("المستوى الثالث", 5, 6, 3),
    Levels("المستوى الرابع", 7, 8, 4),
    Levels("المستوى الخامس", 9, 10, 5),
  ];
}