
class HttpException implements Exception { // we are configuring our exception here

  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
    //return super.toString();
  }

}