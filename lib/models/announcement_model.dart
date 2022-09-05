class Announcement {
  final String id;
  final String title;
  final DateTime date;
  bool isNew = false;


  Announcement({
    required this.id,
    required this.title,
    required this.date,
    required this.isNew,
  });
}