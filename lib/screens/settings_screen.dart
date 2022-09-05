import 'package:dgfhuss/models/student_information.dart';
import 'package:dgfhuss/providers/grievances.dart';
import 'package:dgfhuss/providers/suggestions.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/degree.dart';
import '../providers/schedule.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'contact_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _student = Provider.of<AuthProvider>(context).student;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const MyAppBar(pageTitle: 'الإعدادات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/hadhramout.png',
                ),
                radius: 45.0,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _student.name,
                style: const TextStyle(
                  fontSize: 15
                ),
              ),
              Text(
                '${_student.id}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 30
                ),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          // const Text(
                          //   'YR',
                          //   style: TextStyle(
                          //       fontSize: 12
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: 1,
                          // ),
                          Text(
                            '${_student.wallet}',
                            style: const TextStyle(
                              fontSize: 24
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'المحفظة',
                        style: TextStyle(
                          color: Colors.grey,
                      ),)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  width: _screenSize.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      ListTile(
                        onTap: (){
                          Provider.of<ScheduleProvider>(context,listen: false).getSchedule();
                        },
                        title: const Text('تعديل البيانات'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8)
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_left),
                      ),
                      ListTile(
                        onTap: (){
                          Provider.of<SuggestionsProvider>(context,listen: false).postSuggestions();
                        },
                        title: const Text('الشكاوي والإقتراحات'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8)
                            ),
                          ),
                          child: const Icon(
                            Icons.comment_outlined,
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_left),
                      ),
                      ListTile(
                        onTap: (){
                        },
                        title: const Text('حول التطبيق'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8)
                            ),
                          ),
                          child: const Icon(
                          Icons.info_outline,
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_left),
                      ),
                      ListTile(
                        onTap: (){
                          Provider.of<AuthProvider>(context,listen: false).logout();
                        },
                        title: const Text('تسجيل الخروج'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8)
                            ),
                          ),
                          child: const Icon(
                            Icons.logout,
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_left),
                      ),

                      // ElevatedButton(
                      //   onPressed: (){
                      //     Provider.of<DegreeProvider>(context, listen: false).getDegree();
                      //   },
                      //   child: const Text('تسجيل الخروج'),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
