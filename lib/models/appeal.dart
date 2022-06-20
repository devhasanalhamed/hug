enum AppealType {
  appeal,
  reSum,
}
class AppealPost{
  final String name;
  final bool isValid;
  final String content;
  final AppealType type;
  AppealPost(
      this.name,
      this.isValid,
      this.content,
      this.type,
      );
}

class AppealElement {
  final String name;
  final AppealType type;

  AppealElement(
      this.name,
      this.type,
      );
}