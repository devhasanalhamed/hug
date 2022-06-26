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
    return SizedBox(
      width: 60,
      height: 100,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: Text(
                  nameOfSubject,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gradeOfSubject,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Text(
                  '/150',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
