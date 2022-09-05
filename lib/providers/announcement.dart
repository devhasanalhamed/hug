import 'package:flutter/material.dart'; //this file is to provide auth(student) data to sign in and to the application
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/announcement_model.dart';
import '../models/student_information.dart';

class AnnouncementProvider extends ChangeNotifier {
  final Student? student;
  AnnouncementProvider({
    required this.student
  });

  final List<Announcement> _announcementList = [];

  List<Announcement> get announcementList {
    _announcementList.sort((a, b) => b.date.compareTo(a.date),);
    return[..._announcementList];
  }
  List<String> receivedElements = [];

  Future<void> getAnnouncement() async {
    const  url = 'http://10.0.2.2:3001/ads';
    try{
      final response = await http.get(Uri.parse(url),);
      final responseData = json.decode(response.body) as List<dynamic>;
      responseData.forEach((element) {
        if (receivedElements.contains(element['_id'])){
          print('already there');
          return;
        }
        receivedElements.add(element['_id']);
        _announcementList.add(
          Announcement(
            id: element['_id'],
            title: element['title'],
            date: DateTime.parse(element['dateNo']),
            isNew: false,
          ),
        );
      });
    }
    catch(error){
      print('announcement : $error');
      rethrow;
    }
    // notifyListeners();
  }

  void getPersonalAnnouncement(){
    final list = student!.notification;
    for (var element in list) {
      if (receivedElements.contains('${element['id']}')){
        print('personal announcement already there');
      }
      receivedElements.add('${element['id']}');
      _announcementList.insert(0, Announcement(
        id: '${element['id']}',
        title: element['notify'],
        date: DateTime.parse(element['date']),
        isNew: true,
      ));
    }
    // notifyListeners();
  }
}