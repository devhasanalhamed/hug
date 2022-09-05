class Student {
  //student class to catch up the data from server the provide it inside application
  String name;
  int id;
  String email;
  DateTime age;
  bool state;
  int wallet;
  String collage;
  String department;
  String level;
  String typeOfRegister;
  String gpa;
  List notification;
  String group1;
  String group2;
  String nationality;
  String yearOfRegister;
  String sex;
  String placeOfBirth;
  String semester;
  DateTime dateOfBirth;
  String grade;

  Student({
    required this.name,
    required this.id,
    required this.email,
    required this.age,
    required this.state,
    required this.wallet,
    required this.level,
    required this.department,
    required this.typeOfRegister,
    required this.gpa,
    required this.sex,
    required this.nationality,
    required this.notification,
    required this.placeOfBirth,
    required this.yearOfRegister,
    required this.group1,
    required this.group2,
    required this.semester,
    required this.collage,
    required this.grade,
    required this.dateOfBirth,
  });
}