import 'package:flutter/material.dart';

class NewsModel {
  final String title;
  final String content;
  final DateTime publishDate;
  final String imageLink;

  NewsModel ({
    required this.title,
    required this.content,
    required this.publishDate,
    required this.imageLink,
  });

}