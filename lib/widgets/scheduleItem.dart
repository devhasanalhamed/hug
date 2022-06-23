import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  final subjectName;
  final startTime;
  final endTime;
  final className;

  const ScheduleItem({
    required this.subjectName,
    required this.startTime,
    required this.endTime,
    required this.className,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 7,
        child: ListTile(
          title: Text(
            subjectName.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          subtitle: Text(
            startTime + " - " + endTime,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(70)),
              child: Text(
                className,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
        ),
      ),
    );
  }
}
