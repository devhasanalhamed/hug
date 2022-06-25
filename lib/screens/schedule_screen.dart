import 'package:flutter/material.dart';
//import 'package:time_planner/time_planner.dart';
// import 'package:hug/widgets/schedule/schedule_widget.dart';
import '../models/schedule.dart';
import '../providers/dummy_data.dart';
import '../widgets/scheduleItem.dart';

class ScheduleScreen extends StatefulWidget {
  static String routeName = 'schedule_screen';
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleElement> scheduleElement = AppStructure().scheduleElements;

  Days _days = Days.monday;
  var isPressed = false;

  void whatDay(String day) {
    setState(() {
      switch (day) {
        case "الاحد":
          _days = Days.sunday;
          break;
        case "الاثنين":
          _days = Days.monday;
          break;
        case "الثلاثاء":
          _days = Days.thursday;
          break;
        case "الاربعاء":
          _days = Days.wednesday;
          break;
        case "الخميس":
          _days = Days.tuesday;
          break;
      }
    });
  }

  Widget _daySelecter(day) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        primary: Colors.white,
        padding: const EdgeInsets.all(5),
        fixedSize: const Size(70, 50),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onPressed: () {
        whatDay(day);
        isPressed = true;
      },
      child: Text(
        day,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //var _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('الجدول الدراسي'),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (scheduleElement
                        .any((element) => element.dayName == _days))
                      ...(scheduleElement)
                          .map(
                            (e) => (e.dayName == _days)
                                ? ScheduleItem(
                                    subjectName: e.subjectName,
                                    startTime: e.startTime.toString(),
                                    endTime: e.endTime.toString(),
                                    className: e.className)
                                : const SizedBox.shrink(),
                          )
                          .toList()
                    else
                      Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Image.asset(
                              "assets/images/waiting.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          const Text("لا توجد محاضرات لهذا اليوم")
                        ],
                      )),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  // borderRadius: const BorderRadius.only(
                  //   bottomLeft: Radius.circular(20),
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _daySelecter("الاحد"),
                    _daySelecter("الاثنين"),
                    _daySelecter("الثلاثاء"),
                    _daySelecter("الاربعاء"),
                    _daySelecter("الخميس"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// Center(
//           child: TimePlanner(
//             currentTimeAnimation: false,
//             startHour: 8,
//             endHour: 18,
//             headers: const [
//               TimePlannerTitle(
//                   title: "Sunday", titleStyle: TextStyle(fontSize: 13)),
//               TimePlannerTitle(
//                   title: "monday", titleStyle: TextStyle(fontSize: 13)),
//               TimePlannerTitle(
//                   title: "thurasday", titleStyle: TextStyle(fontSize: 13)),
//               TimePlannerTitle(
//                   title: "wnsday", titleStyle: TextStyle(fontSize: 13)),
//               TimePlannerTitle(
//                   title: "tusday", titleStyle: TextStyle(fontSize: 13)),
//             ],
//             style: TimePlannerStyle(
//               showScrollBar: true,
//             ),
//             tasks: [
//               TimePlannerTask(
//                 minutesDuration: 120,
//                 dateTime: TimePlannerDateTime(day: 0, hour: 8, minutes: 0),
//                 child: const Text("AI"),
//               ),
//             ],
//           ),
//         )

// schedul(scheduleSun: scheduleSun, scheduleMon: scheduleMon, scheduleTue: scheduleTue, scheduleWed: scheduleWed, scheduleThu: scheduleThu),
// class schedul extends StatelessWidget {
//   const schedul({
//     Key? key,
//     required this.scheduleSun,
//     required this.scheduleMon,
//     required this.scheduleTue,
//     required this.scheduleWed,
//     required this.scheduleThu,
//   }) : super(key: key);

//   final List<ScheduleElement> scheduleSun;
//   final List<ScheduleElement> scheduleMon;
//   final List<ScheduleElement> scheduleTue;
//   final List<ScheduleElement> scheduleWed;
//   final List<ScheduleElement> scheduleThu;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         SizedBox(
//           height: scheduleSun.length <= 2
//               ? 220
//               : 200.0 + 50 * (scheduleSun.length),
//           width: double.infinity,
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             color: const Color.fromRGBO(250, 245, 245, 1.0),
//             child: Column(
//               children: [
//                 const Text('الأحد'),
//                 Expanded(
//                   child: GridView.builder(
//                     reverse: false,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.4,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: scheduleSun.length,
//                     itemBuilder: (ctx, index) {
//                       return GridTile(
//                         child: ScheduleElementWidget(scheduleSun[index]),
//                       );
//                     },
//                     primary: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: scheduleMon.length <= 2
//               ? 220
//               : 200.0 + 50 * (scheduleMon.length),
//           width: double.infinity,
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             color: const Color.fromRGBO(250, 245, 245, 1.0),
//             child: Column(
//               children: [
//                 const Text('الإثنين'),
//                 Expanded(
//                   child: GridView.builder(
//                     reverse: false,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.4,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: scheduleMon.length,
//                     itemBuilder: (ctx, index) {
//                       return GridTile(
//                         child: ScheduleElementWidget(scheduleMon[index]),
//                       );
//                     },
//                     primary: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: scheduleTue.length <= 2
//               ? 220
//               : 200.0 + 50 * (scheduleTue.length),
//           width: double.infinity,
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             color: const Color.fromRGBO(250, 245, 245, 1.0),
//             child: Column(
//               children: [
//                 const Text('الثلاثاء'),
//                 Expanded(
//                   child: GridView.builder(
//                     reverse: false,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.4,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: scheduleTue.length,
//                     itemBuilder: (ctx, index) {
//                       return GridTile(
//                         child: ScheduleElementWidget(scheduleTue[index]),
//                       );
//                     },
//                     primary: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: scheduleWed.length <= 2
//               ? 220
//               : 200.0 + 50 * (scheduleWed.length),
//           width: double.infinity,
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             color: const Color.fromRGBO(250, 245, 245, 1.0),
//             child: Column(
//               children: [
//                 const Text('الأربعاء'),
//                 Expanded(
//                   child: GridView.builder(
//                     reverse: false,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.4,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: scheduleWed.length,
//                     itemBuilder: (ctx, index) {
//                       return GridTile(
//                         child: ScheduleElementWidget(scheduleWed[index]),
//                       );
//                     },
//                     primary: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: scheduleThu.length <= 2
//               ? 220
//               : 200.0 + 50 * (scheduleThu.length),
//           width: double.infinity,
//           child: Card(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             color: const Color.fromRGBO(250, 245, 245, 1.0),
//             child: Column(
//               children: [
//                 const Text('الخميس'),
//                 Expanded(
//                   child: GridView.builder(
//                     reverse: false,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.4,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: scheduleThu.length,
//                     itemBuilder: (ctx, index) {
//                       return GridTile(
//                         child: ScheduleElementWidget(scheduleThu[index]),
//                       );
//                     },
//                     primary: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// List<ScheduleElement> get scheduleSun {
//   return scheduleElement
//       .where((element) => element.dayName == Days.sunday)
//       .toList();
// }

// List<ScheduleElement> get scheduleMon {
//   return scheduleElement
//       .where((element) => element.dayName == Days.monday)
//       .toList();
// }

// List<ScheduleElement> get scheduleTue {
//   return scheduleElement
//       .where((element) => element.dayName == Days.tuesday)
//       .toList();
// }

// List<ScheduleElement> get scheduleWed {
//   return scheduleElement
//       .where((element) => element.dayName == Days.wednesday)
//       .toList();
// }

// List<ScheduleElement> get scheduleThu {
//   return scheduleElement
//       .where((element) => element.dayName == Days.thursday)
//       .toList();
// }
