import 'package:dgfhuss/providers/auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';


class TransactionsProvider with ChangeNotifier {

  Future<void> newTransaction(int studentID, String service, int price) async {
    try{
      const  url = 'http://192.168.137.1:3001/transaction/addTransaction';
      final response = await http.post(Uri.parse(url),body: {
        'username': '$studentID',
        'date': DateTime.now().toString(),
        'service': service,
        'type': '',
        'price': '$price'
      });
      print('new transaction ${response.statusCode}');
    }
    catch(error){
      print(error);
      rethrow;
    }
  }
}