import 'dart:io';

import 'package:dgfhuss/providers/transactions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import '../models/degree_model.dart';
import '../models/student_information.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DegreeProvider with ChangeNotifier { //provide get degree function but need name and id
  final String id;
  final String name;
  final Student? student;
  DegreeProvider({required this.id, required this.name,required this.student}); // a constructor to pass data


  final List<DegreeModel> _fetchedDegrees = [];


  List<FinalDegreeModel> get listOfDegrees{
   return _listOfDegrees;
  }

  final List<FinalDegreeModel> _listOfDegrees = [];

  Future<void> getDegree() async {
    _fetchedDegrees.clear();
    _listOfDegrees.clear();
    final url = 'http://192.168.137.1:3001/degree?name=$name&username=$id'; //assertion query into url
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    final responseData = json.decode(response.body) as List<dynamic>;
    // print(responseData);
    responseData.forEach((element) {
      _fetchedDegrees.add(DegreeModel(
        levelName: element['levelName'],
        levelOrder: element['id'],
        semesterModel: element['semesters'],
      ));
    });
    // print(_fetchedDegrees[1].levelName);
    // print(_fetchedDegrees[1].semesterModel);
    // print(_fetchedDegrees[1].levelOrder);
    var controller = 1;
    _fetchedDegrees.forEach((level) {
      level.semesterModel.forEach((semester) {
        final test = FinalDegreeModel(
          levelName: level.levelName,
          semesterName: semester['semester'],
          semesterAVG: semester['semAvg'],
          semesterOrder: controller,
          subjects: semester['subjects'],
        );
        controller ++;
        // print(test.subjects);
        _listOfDegrees.add(test);
      });
    });
    for (var i in _listOfDegrees){
      print(i.semesterOrder);
      print(i.levelName);
      print(i.semesterName);
      print(i.subjects);
      print(i.semesterAVG);
    }
  }

  Future<void> getGradesPDF(List subjectsList) async {
    TransactionsProvider().newTransaction(student!.id, 'بيان درجات', 200).then(
        (_){
          openFile(url: 'http://192.168.137.1:3001/pdf/degreeSt?'
              'username=${student!.id}'
              '&name=${student!.name}'
              '&collage=${student!.collage}'
              '&department=${student!.department}'
              '&level=${student!.level}'
              '&GPA=${student!.gpa}'
              '&degreeLevel=100%'
              '&semestar=${student!.semester}'
              '&semAvg=xxx'
              '&semGrd=30'
              '&sex=${student!.sex}'
              '&nationality=${student!.nationality}'
              '&POB=${student!.placeOfBirth}'
              '&DOB=${student!.dateOfBirth}'
              '&yearToJoin=${student!.yearOfRegister}'
              '&gread=${student!.grade}'
              '&subjects=${json.encode(subjectsList)}'
            ,fileName: 'grades.pdf',
          );
        }
    );
  }

  Future openFile({required String url, String? fileName}) async{
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try{
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    }
    catch(error){
      rethrow;
    }

  }
}

