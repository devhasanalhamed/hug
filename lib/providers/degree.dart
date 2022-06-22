import 'package:flutter/material.dart';

import '../models/degree_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DegreeProvider with ChangeNotifier { //provide get degree function but need name and id
  final String id;
  final String name;
  DegreeProvider({required this.id, required this.name}); // a constructor to pass data


  final List<DegreeModel> _listOfDegrees = [];

  List<DegreeModel> get listOfDegrees{
   return _listOfDegrees;
  }

  Future<void> getDegree() async {
    final url = 'http://10.0.2.2:3001/degree?name=$name&username=$id'; //assertion query into url
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    print(responseData);
  }
}