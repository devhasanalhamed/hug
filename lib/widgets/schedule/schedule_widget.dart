import 'package:flutter/material.dart';

import '../../models/schedule.dart';

class ScheduleElementWidget extends StatelessWidget {
  const ScheduleElementWidget(this.scheduleSubject, {Key? key})
      : super(key: key);

  final ScheduleElement scheduleSubject;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 180,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                scheduleSubject.subjectName,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              scheduleSubject.teacherName,
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${scheduleSubject.startTime}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  '${scheduleSubject.startTime}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  ' - ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  '${scheduleSubject.endTime}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  '${scheduleSubject.endTime}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Text(
              scheduleSubject.className,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
