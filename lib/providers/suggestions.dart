import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/student_information.dart';

class SuggestionsProvider with ChangeNotifier {
  final Student? studentCopy;
  SuggestionsProvider({this.studentCopy});

  Future<void> postSuggestions() async {
    try{
      const  url = 'http://10.0.2.2:3001/suggestion/create';
      final response = await http.post(Uri.parse(url),body: {
        'username': '1111111111',
        'name': 'my name',
        'department': 'department',
        'level': '',
        'type': 'اقتراح',
        'body':'خالد الحامدي',
      });
      print(response.statusCode);
    }
    catch(error){
      print(error);
      rethrow;
    }
  }
}