import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart' as format;

// ignore: camel_case_types
class uniCalTile extends StatelessWidget {
  final title;
  final date;
  final dateHij;
  final daysLeft;
  const uniCalTile({
    Key? key,
    required this.title,
    required this.date,
    required this.dateHij,
    required this.daysLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _screenSize.width * 0.70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "هـ $dateHij  $date م",
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: _screenSize.width * 0.15,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    daysLeft,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  if (daysLeft != "إنتهى")
                    const Text(
                      "يوم",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(30)),
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.all(8.0),
      height: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
