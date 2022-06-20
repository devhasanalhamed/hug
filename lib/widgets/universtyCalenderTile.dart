import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class uniCalTile extends StatelessWidget {
  final title;
  final date;
  final daysLeft;
  const uniCalTile({
    Key? key,
    required this.title,
    required this.date,
    required this.daysLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                date,
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            // padding: const EdgeInsets.all(2),
            width: 75,
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
