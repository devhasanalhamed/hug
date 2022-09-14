import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/student_information.dart';

class SuggestionsProvider with ChangeNotifier {
  Future<void> postSuggestions(
      Student student, String? type, String body) async {
    try {
      const url = 'http://192.168.137.1:3001/suggestion/create';
      final response = await http.post(Uri.parse(url), body: {
        'username': student.id.toString(),
        'name': student.name,
        'department': student.department,
        'level': student.level,
        'type': type,
        'body': body,
      });
      print(response.statusCode);
    } catch (error) {
      print("something went wrong in sugg");
    }
  }
}
