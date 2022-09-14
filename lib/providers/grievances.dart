import 'package:dgfhuss/models/student_information.dart';
import 'package:dgfhuss/providers/transactions.dart';
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
    required int cost,
  }) async {
    const  url = 'http://192.168.137.1:3001/grievances/create';
    try{
      TransactionsProvider().newTransaction(studentCopy!.id, type, cost).then(
          (_) async {
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
      );
    }
    catch(error){
      rethrow;
    }
  }
}