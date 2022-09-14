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
    _announcementList.clear();
    const  url = 'http://192.168.137.1:3001/ads';
    try{
      final response = await http.get(Uri.parse(url),);
      final responseData = json.decode(response.body) as List<dynamic>;
      responseData.forEach((element) {
        receivedElements.add(element['_id']);
        _announcementList.add(
          Announcement(
            id: element['_id'],
            title: element['title'],
            date: DateTime.parse(element['date']),
            isNew: false,
          ),
        );
      });
    }
    catch(error){
      print('announcement : 511');
      rethrow;
    }
    // notifyListeners();
  }

  void getPersonalAnnouncement(){
    final list = student!.notification;
    for (var element in list) {
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