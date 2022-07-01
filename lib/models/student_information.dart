class Student {
  //student class to catch up the data from server the provide it inside application
  String name;
  int id;
  String email;
  int age;
  int phoneNum;
  bool state;
  int wallet;
  String department;
  String level;
  String typeOfRegister;
  String gpa;

  Student({
    required this.name,
    required this.id,
    required this.email,
    required this.age,
    required this.phoneNum,
    required this.state,
    required this.wallet,
    required this.level,
    required this.department,
    required this.typeOfRegister,
    required this.gpa,
  });
}