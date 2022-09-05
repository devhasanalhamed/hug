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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17, color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  dateHij + "  " + date,
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            // padding: const EdgeInsets.all(2),
            width: 51
            ,
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
