import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news.dart';

import 'package:intl/intl.dart';


class NewsProvider with ChangeNotifier{

  List<NewsModel> _newsList =[];

  List<NewsModel> get newsList {
    return[..._newsList];
}
  Future<void> getNews() async {
    const url = 'http://192.168.137.1:3001/news';
    try{
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body) as List<dynamic>;
      final List<NewsModel> _fetchedNews = [];
      for (var element in responseData) {
        _fetchedNews.add(
          NewsModel(
            title: element['title'],
            content: element['body'],
            publishDate: DateTime.now(),
            imageLink: '',
          ),
        );
      }
      _newsList = _fetchedNews;
    }
    catch(error){
      rethrow;
    }
    notifyListeners();
  }
}