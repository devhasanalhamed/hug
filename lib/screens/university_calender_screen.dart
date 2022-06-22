import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as format;
import 'package:hijri/hijri_calendar.dart';

import '../models/university_calendar.dart';
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
  List<UniversityCalendarElement> universityCalendar =
      AppStructure().universityCalendar;

  String dayLeft(DateTime date) {
    final difference = date.difference(DateTime.now()).inDays;
    if (difference < 0) {
      return "إنتهى";
    } else {
      return difference.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      appBar: const MyAppBar(pageTitle: 'التقويم الجامعي'),
      body: Column(
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
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("التقويم الجامعي 2022"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: universityCalendar.length,
              itemBuilder: (ctx, index) => uniCalTile(
                title: universityCalendar[index].description,
                date: format.DateFormat.yMEd()
                    .format(universityCalendar[index].date),
                daysLeft: dayLeft(universityCalendar[index].date),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class uniCal extends StatelessWidget {
//   const uniCal({
//     Key? key,
//     required this.universityCalendar,
//   }) : super(key: key);

//   final List<UniversityCalendarElement> universityCalendar;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           universityCalendar[index].description,
//           style: Theme.of(context).textTheme.bodyText1,
//           textDirection: TextDirection.rtl,
//         ),
//         Text(
//           format.DateFormat.yMd()
//               .format(universityCalendar[index].date),
//           style: Theme.of(context).textTheme.bodyText1,
//           textDirection: TextDirection.rtl,
//         ),
//         Text(
//           HijriCalendar.fromDate(universityCalendar[index].date)
//               .toString(),
//           style: Theme.of(context).textTheme.bodyText1,
//           textDirection: TextDirection.rtl,
//         ),
//       ],
//     );
//   }
// }