import 'package:flutter/material.dart';


class DegreesModel {
  final String name;
  final Map<String,String> degrees;
  final int sheetOrder;

  DegreesModel({
    required this.name,
    required this.degrees,
    required this.sheetOrder,
  });
}