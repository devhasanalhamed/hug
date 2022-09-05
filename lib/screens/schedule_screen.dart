import 'package:dgfhuss/providers/schedule.dart';
import 'package:dgfhuss/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  Days _days = Days.sunday;
  var isPressed = true;

  late Future myFuture;
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
          _days = Days.tuesday;
          break;
        case "الاربعاء":
          _days = Days.wednesday;
          break;
        case "الخميس":
          _days = Days.thursday;
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
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  void initState() {
      myFuture = Provider.of<ScheduleProvider>(context,listen: false).getSchedule();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ScheduleElement> scheduleElement = Provider.of<ScheduleProvider>(context,listen: false).scheduleList;
    //var _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('الجدول الدراسي'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: myFuture,
          builder: (ctx, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Row(
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
              );
            }
            return const LoadingWidget('جاري تنزيل الجدول الدراسي');
          },
        ),
    );
  }
}
