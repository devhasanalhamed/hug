import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/announcement_model.dart';

import '../providers/dummy_data.dart';
import '../providers/announcement.dart';


class NotificationScreen extends StatefulWidget {
  static String routeName = 'notification_screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final announcements = Provider.of<AnnouncementProvider>(context).announcementList;
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'الإشعارات'),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (ctx, index) => Container(
          height: 120,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25),),
            border: Border.all(
              color: announcements[index].isNew?Colors.red:Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    announcements[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(announcements[index].date),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: IconButton(
              //     onPressed: (){
              //     },
              //     icon: const Icon(Icons.close),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
