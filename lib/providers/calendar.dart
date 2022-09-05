import 'package:dgfhuss/models/calendar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/student_information.dart';

class CalendarProvider with ChangeNotifier {
  final Student? studentCopy;
  CalendarProvider({this.studentCopy});

  final List<Calendar> _calendar = [];

  final List<CalendarElement> _calendarElements = [];

  List<CalendarElement> get calendarElements {
    return [..._calendarElements];
  }

  Future<void> getCalendar() async {
    try{
      const  url = 'http://10.0.2.2:3001/calander/last';
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body) as Map<String,dynamic>;
      if(_calendar.isEmpty){
        _calendar.add(
          Calendar(
            id: responseData['_id'],
            year: responseData['year'],
            semester1: responseData['semester1'],
            semester2: responseData['semester2'],
          ),
        );
        if(_calendarElements.isEmpty){
          for (var element in _calendar) {
            for (var elementSem1 in element.semester1) {
              _calendarElements.add(
                CalendarElement(
                    id: elementSem1['Id'].toString(),
                    date: DateTime.parse(elementSem1['date']),
                    description: elementSem1['details']
                ),
              );
            }
            for (var elementSem2 in element.semester2) {
              _calendarElements.add(
                CalendarElement(
                    id: elementSem2['Id'].toString(),
                    date: DateTime.parse(elementSem2['date']),
                    description: elementSem2['details']
                ),
              );
            }
          }
        }
      }
    }
    catch(error){
      print(error);
      rethrow;
    }
    notifyListeners();
  }
}