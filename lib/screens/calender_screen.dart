
import 'package:dgfhuss/providers/calendar.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as format;
import 'package:hijri/hijri_calendar.dart';
import 'package:provider/provider.dart';

import '../models/calendar.dart';
import '../providers/dummy_data.dart';
import '../widgets/universtyCalenderTile.dart';

class UniversityCalenderScreen extends StatefulWidget {
  static String routeName = 'university_calender_screen';
  const UniversityCalenderScreen({Key? key}) : super(key: key);

  @override
  _UniversityCalenderScreenState createState() =>
      _UniversityCalenderScreenState();
}

class _UniversityCalenderScreenState extends State<UniversityCalenderScreen> {

  String dayLeft(DateTime date) {
    final difference = date.difference(DateTime.now()).inDays;
    if (difference < 0) {
      return "إنتهى";
    } else {
      return difference.toString();
    }
  }
  late Future myFuture;
  var loading = true;


  @override
  void initState() {
    myFuture = Provider.of<CalendarProvider>(context,listen: false).getCalendar().then((value) => loading=false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<CalendarElement> calendar = Provider.of<CalendarProvider>(context).calendarElements;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      appBar: const MyAppBar(pageTitle: 'التقويم الجامعي'),
      body: FutureBuilder(
        future: loading?null:myFuture,
        builder: (ctx,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Text("تاريخ اليوم"),
                      Text(
                        HijriCalendar.fromDate(DateTime.now()).toString() +
                            "  " +
                            format.DateFormat.yMEd().format(DateTime.now()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("التقويم الجامعي ${DateTime.now().year}"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: calendar.length,
                    itemBuilder: (ctx, index) => uniCalTile(
                      title: calendar[index].description,
                      date: format.DateFormat.yMEd()
                          .format(calendar[index].date),
                      dateHij: HijriCalendar.fromDate(calendar[index].date).toString(),
                      daysLeft: dayLeft(calendar[index].date),
                    ),
                  ),
                ),
              ],
            );
          }
          return const LoadingWidget('جاري تنزيل التقويم الجامعي');
        }
      )
    );
  }
}
