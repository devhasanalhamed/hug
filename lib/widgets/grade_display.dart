import 'package:flutter/material.dart';

class GradesDisplay extends StatelessWidget {
  final String nameOfSubject;
  final String gradeOfSubject;

  const GradesDisplay({
    Key? key,
    required this.nameOfSubject,
    required this.gradeOfSubject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gradeOfSubject,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            nameOfSubject,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
