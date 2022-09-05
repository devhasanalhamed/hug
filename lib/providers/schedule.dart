import 'package:dgfhuss/models/schedule.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/student_information.dart';

class ScheduleProvider with ChangeNotifier {
  final Student? studentCopy;
  ScheduleProvider({this.studentCopy});

  final List<ScheduleElement>scheduleList = [];
  
  Future<void> getSchedule() async {
    try{
      final url = 'http://10.0.2.2:3001/schedule/'
          '${studentCopy!.department}'
          '/${studentCopy!.level}'
          '/${studentCopy!.semester}'
          '/${studentCopy!.group1}'
          '/${studentCopy!.group2}';
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body) as Map<String,dynamic>;
      var resp = responseData['subjects'] as List<dynamic>;
      print(resp);
      if(scheduleList.isEmpty){
        for (var element in resp) {
          Days x = Days.tuesday;
          if('الاحد' == element['day']) {
            x = Days.sunday;
          }
          if('الاثنين' == element['day']) {
            x = Days.monday;
          }
          if('الثلاثاء' == element['day']) {
            x = Days.tuesday;
          }
          if('الاربعاء' == element['day']) {
            x = Days.wednesday;
          }
          if('الخميس' == element['day']) {
            x = Days.thursday;
          }
          scheduleList.add(
              ScheduleElement(
                subjectName: element['subject'],
                className: element['place'],
                teacherName: element['prof'],
                dayName: x,
                startTime: element['time_from'],
                endTime: element['time_to'],
                startTimeSym:'',
                endTimeSym: '',
              )
          );
        }
      }
    }
    catch(error){
      print(error);
      rethrow;
    }
  }
}