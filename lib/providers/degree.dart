import 'package:flutter/material.dart';

import '../models/degree_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DegreeProvider with ChangeNotifier { //provide get degree function but need name and id
  final String id;
  final String name;
  DegreeProvider({required this.id, required this.name}); // a constructor to pass data


  final List<DegreeModel> _fetchedDegrees = [];

  List<FinalDegreeModel> get listOfDegrees{
   return _listOfDegrees;
  }

  final List<FinalDegreeModel> _listOfDegrees = [];

  Future<void> getDegree() async {
    final url = 'http://10.0.2.2:3001/degree?name=$name&username=$id'; //assertion query into url
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body) as List<dynamic>;
    // print(responseData);
    responseData.forEach((element) {
      _fetchedDegrees.add(DegreeModel(
        levelName: element['levelName'],
        levelOrder: element['id'],
        semesterModel: element['semesters'],
      ));
    });
    _fetchedDegrees.forEach((level) {
      level.semesterModel.forEach((semester) {
        final test = FinalDegreeModel(
          levelName: level.levelName,
          semesterName: semester['semester'],
          semesterAVG: semester['semAvg'],
          semesterOrder: '0',
          subjects: semester['subjects'],
        );
        print(test.subjects);
      });
    });
  // print(_listOfDegrees.length);
  }
}