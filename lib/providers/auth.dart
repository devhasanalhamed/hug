import 'dart:io';

import 'package:dgfhuss/models/http_exception.dart';
import 'package:dgfhuss/providers/transactions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; //this file is to provide auth(student) data to sign in and to the application
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';

import '../models/student_information.dart';

class AuthProvider with ChangeNotifier{ // a class with a Notifier to update the widget that listen to state
  var _student = Student( //an instance of student to refill it with data
    name: '',
    id: 0,
    email: '',
    age: DateTime.now(),
    state: false,
    wallet: 0,
    level: '',
    department: '',
    typeOfRegister: '',
    gpa:'',
    nationality: '',
    group1: '',
    group2: '',
    sex: '',
    placeOfBirth: '',
    yearOfRegister: '',
    notification: [],
    semester: '',
    collage: '',
    grade: '',
    dateOfBirth: DateTime.now(),
  );

  var rememberMe = false;
  var savedName = '';
  var id = '';
  var fingerprint = '';

  Student get student{ //to prevent the user to change the instance from outside
    return _student;
  }


  bool get isAuth{ //a simple method to check if it's auth to move to the next screen or not
    // _student.state == true &&
    if(_student.name.isNotEmpty){
      return true;
    }
    return false;
  }


  Future<void> getSavedData() async { //get data, if there are saved data from previous login
    final prefs = await SharedPreferences.getInstance();
    final _rememberMe = prefs.getBool('rememberMe'); //remember me data
    final _savedName = prefs.getString('student'); //user data
    final _id = prefs.getString('id'); //user data
    final _fingerprint = prefs.getString('password');
    if (_rememberMe != null){
      rememberMe = _rememberMe;
      if (_savedName != null && _savedName.isNotEmpty){
        savedName = _savedName;
        if(_id != null && _id.length == 11){
          id = _id;
          if (_fingerprint != null){
            fingerprint = _fingerprint;
          }
        }
      }
    }
    notifyListeners();
  }

  Future<void> trySignWithFingerprint() async {
    getSavedData();
    final lastStep = await authenticate();
    if(lastStep){
      authLogin(id, fingerprint, rememberMe);
    }
  }

  Future<void> removeSavedData() async { //remove data, if there are saved data from previous login
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('rememberMe');
    prefs.remove('student');
    prefs.remove('id');
    prefs.remove('password');
    rememberMe = false;
    savedName = '';
    id = '';
    fingerprint = '';
    notifyListeners();
  }

  Future<void> authLogin(userName, password, rememberMe) async{ //a function to login and get student data from the server
    const url ='http://192.168.137.1:3001/studentLogin';
    try {
      final response = await http.post(Uri.parse(url),body: {
        'username': userName,
        'password': password,
      });
      if (response.statusCode == 200){
        final responseData = json.decode(response.body);
        final Student studentData = Student(
          name: responseData['name'],
          id: responseData['username'],
          email: responseData['email'],
          age: DateTime.parse(responseData['DOB']),
          state: responseData['state'],
          wallet: responseData['wallet'],
          level: responseData['level'],
          department: responseData['department'],
          typeOfRegister: responseData['typeOfRegister'],
          gpa: responseData['GPA'],
          nationality: responseData['nationality'],
          group1: responseData['group1'],
          group2: responseData['group2'],
          sex: responseData['sex'],
          placeOfBirth: responseData['POB'],
          yearOfRegister: responseData['yearToJoin'],
          notification: responseData['notification'],
          semester: responseData['semester'],
          grade: responseData['gread'],
          collage: responseData['collage'],
          dateOfBirth: DateTime.parse(responseData['DOB']),
        );
        _student = studentData;
        final prefs = await SharedPreferences.getInstance();
        if (rememberMe){
          prefs.setBool('rememberMe', rememberMe);
          prefs.setString('student', responseData['name']);
          prefs.setString('id', '${responseData['username']}');
          prefs.setString('password', password);
        }
        // if (!rememberMe){
        //   prefs.remove('rememberMe');
        //   prefs.remove('student');
        //   prefs.remove('id');
        //   prefs.remove('`password`');
        // }
        notifyListeners();
      }
      else{
        throw HttpException('');
      }
    }
    catch(error){
      print('error');
      rethrow;
    }
  }

  Future<void> logout() async{
    _student = Student(
      name: '',
      id: 0,
      email: '',
      age: DateTime.now(),
      state: false,
      wallet: 0,
      level: '',
      department: '',
      typeOfRegister: '',
      gpa: '',
      nationality: '',
      group1: '',
      group2: '',
      sex: '',
      placeOfBirth: '',
      yearOfRegister: '',
      notification: [],
      semester: '',
      collage: '',
      grade: '',
      dateOfBirth: DateTime.now(),
    );
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('student'));

    notifyListeners();
  }
  static final _authFingerprint = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try{
      return await _authFingerprint.canCheckBiometrics;
    }
    on PlatformException catch(error){
      return false;
    }
  }


  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try{
      return await _authFingerprint.authenticate(
        localizedReason: 'الدخول بإستخدام مستشعر البصمة',
        options: const AuthenticationOptions(
          useErrorDialogs: true, //if we have no permission
          stickyAuth: true, //the dialog refreshable
        ),
      );
    }
    on PlatformException catch(error){
      print('finger print $error');
      return false;
    }

  }


  Future<void> updateWallet() async{
    try{
      print('student id from upd: ${_student.id}');
      print(_student.wallet);
      final  url = 'http://192.168.137.1:3001/updateUser?username=${_student.id}';
      final response = await http.get(Uri.parse(url));
      final studentUpdate = json.decode(response.body);
      _student.wallet = studentUpdate['wallet'];
      print(_student.wallet);
    }
    catch(error){
      print('update wallet error $error');
    }
  }

  Future<void> renewState() async {
    const  url = 'http://192.168.137.1:3001/updateUserState';
    try{
            final response = await http.patch(Uri.parse(url),body: {
              'username':'${student.id}',
              'state':'true',
              'wallet':'${_student.wallet - 5000}',
            });
            print(response.statusCode);
            print('student id from ren: ${_student.id}');
            final  anotherUrl = 'http://192.168.137.1:3001/updateUser?username=${_student.id}';
            final anotherResponse = await http.get(Uri.parse(anotherUrl));
            final studentUpdate = json.decode(anotherResponse.body);
            _student.state = studentUpdate['state'];
    }
    catch(error){
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getPDF() async {
    TransactionsProvider().newTransaction(
      student.id,
      'شهادة قيد',
      500,
    ).then(
        (_){
          openFile(
              url: 'http://192.168.137.1:3001/pdf/regCir?'
                  'username=${student.id}'
                  '&name=${student.name}'
                  '&collage=${student.collage}'
                  '&department=${student.department}'
                  '&level=${student.level}'
                  '&typeOfRegister=${student.typeOfRegister}'
                  '&date=${DateTime.now()}',
              fileName: 'pdf.pdf'
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

  Future<void> changePassword(String oldPassword,String newPassword) async {
    try{
      final checkUrl = 'http://192.168.137.1:3001/checkOldPassword?username=${_student.id}&password=$oldPassword';
      final response = await http.get(Uri.parse(checkUrl));
      print(response.statusCode);
      if(response.statusCode == 200){
        const url = 'http://192.168.137.1:3001/changePassword';
        final anotherResponse = http.patch(Uri.parse(url),body: {
          'username':'${_student.id}',
          'password': newPassword,
        });
      }
    }
    catch(error){

    }
  }

  Future<void> forgotMyPassword(String id,String email) async{
    const url = 'http://192.168.137.1:3001/sendForgetPass';
    final response = await http.post(Uri.parse(url),body: {
      'username': id,
      'email': email,
    });
    print(response.statusCode);
  }
}