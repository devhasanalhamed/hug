import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import '../models/advertise.dart';
import '../providers/dummy_data.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = 'notification_screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Advertise> adds = AppStructure().addsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'الإشعارات'),
      body: ListView.builder(
        itemCount: adds.length,
        itemBuilder: (ctx, index) => SizedBox(
          height: 150,
          child: Card(
            child: Column(
              children: [
                Text(adds[index].name),
                Text(adds[index].content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
