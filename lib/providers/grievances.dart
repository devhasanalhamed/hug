import 'package:dgfhuss/models/student_information.dart';
import 'package:flutter/material.dart';

import '../models/degree_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class GrievancesProvider with ChangeNotifier { //provide get degree function but need name and id
  final Student? studentCopy;
  GrievancesProvider({required this.studentCopy}); // a constructor to pass data




  Future<void> postGrievance({
    required String subject,
    required String degree,
    required String reason,
    required String type,
  }) async {
    const  url = 'http://10.0.2.2:3001/grievances/create';
    try{
      final response = await http.post(Uri.parse(url),body: json.encode(
          {
            'username': studentCopy!.id.toString(),
            'name': studentCopy!.name,
            'department': studentCopy!.department,
            'level': studentCopy!.level,
            'date': DateTime.now().toIso8601String(),
            'subject': subject,
            'degree': degree,
            'reson': reason,
            'type': type,
            'state': 'تحت المعالجة',
            'wallet': 2000,
          }
      )
      );

      print(response.statusCode);
    }
    catch(error){
      rethrow;
    }
  }
}