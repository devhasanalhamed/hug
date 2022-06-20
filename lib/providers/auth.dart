import 'package:flutter/material.dart'; //this file is to provide auth(student) data to sign in and to the application

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/student_information.dart';

class AuthProvider with ChangeNotifier{ // a class with a Notifier to update the widget that listen to state
  var _student = Student( //an instance of student to refill it with data
      name: '',
      id: 0,
      email: '',
      age: 0,
      phoneNum: 0,
      state: false,
      wallet: 0,
      level: '',
      department: '',
      typeOfRegister: '',
  );

  var rememberMe = false;
  var savedName = '';
  var id = '';

  Student get student{ //to prevent the user to change the instance from outside
    return _student;
  }

  bool get isAuth{ //a simple method to check if it's auth to move to the next screen or not
    if(_student.state == true && _student.id > 4 && _student.name.length > 4){
      return true;
    }
    return false;
  }

  Future<void> getSavedData() async { //get data, if there are saved data from previous login
    final prefs = await SharedPreferences.getInstance();
    final _rememberMe = prefs.getBool('rememberMe'); //remember me data
    print('get data: $_rememberMe');
    final _savedName = prefs.getString('student'); //user data
    print('get data: $_savedName');
    final _id = prefs.getString('id'); //user data
    print('get data: $_id');
    if (_rememberMe != null){
      print('triggired');
      rememberMe = _rememberMe;
      if (_savedName != null){
        savedName = _savedName;
        if(_id != null){
          id = _id;
        }
      }
    }
    notifyListeners();
  }

  Future<void> removeSavedData() async { //remove data, if there are saved data from previous login
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('rememberMe');
    prefs.remove('student');
    prefs.remove('id');
    notifyListeners();
  }

  Future<void> authLogin(userName, password, rememberMe) async{ //a function to login and get student data from the server
    const url ='http://10.0.2.2:3001';
    try {
      final response = await http.post(Uri.parse(url),body: {
        'username': userName,
        'password': password,
      });
      if (response.statusCode == 200){
        print('success login');
        final responseData = json.decode(response.body);
        final Student studentData = Student(
            name: responseData['name'],
            id: responseData['username'],
            email: responseData['email'],
            age: responseData['age'],
            phoneNum: responseData['phoneNo'],
            state: responseData['state'],
            wallet: responseData['wallet'],
            level: responseData['level'],
            department: responseData['department'],
            typeOfRegister: responseData['typeOfRegister'],
        );
        _student = studentData;
        final prefs = await SharedPreferences.getInstance();
        if (rememberMe){
          prefs.setBool('rememberMe', rememberMe);
          prefs.setString('student', responseData['name']);
          prefs.setString('id', '${responseData['username']}');
        }
        if (rememberMe == false){
          prefs.remove('rememberMe');
          prefs.remove('student');
          prefs.remove('id');
        }
        notifyListeners();
      }
    }
    catch(error){
      print('err');
      rethrow;
    }
  }

  void logout(){
    _student = Student(
      name: '',
      id: 0,
      email: '',
      age: 0,
      phoneNum: 0,
      state: false,
      wallet: 0,
      level: '',
      department: '',
      typeOfRegister: '',
    );
    notifyListeners();
  }

}