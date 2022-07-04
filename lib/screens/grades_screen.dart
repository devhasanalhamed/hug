import 'package:dgfhuss/providers/auth.dart';
import 'package:dgfhuss/providers/degree.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/buttons/elementary_button.dart';
import 'package:dgfhuss/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '../models/degree_model.dart';
import '../widgets/grades_display.dart';

import 'package:provider/provider.dart';
import '../providers/dummy_data.dart';
import '../models/semesters.dart';
import '../providers/degree.dart';

import '../widgets/semester_selecter.dart';


class GradesScreen extends StatefulWidget {
  static String routeName = 'grades_screen';
  const GradesScreen({Key? key}) : super(key: key);

  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  int _semesterHandler = 1;
  late Future getDegrees;
  void selectSemester(val) {
    setState(() {
      _semesterHandler = val;
    });
  }

  FinalDegreeModel? get currentDegree {
    return Provider.of<DegreeProvider>(context,listen: false).listOfDegrees.firstWhere((element) {
      return element.semesterOrder == _semesterHandler;
    });
  }

  @override
  void initState() {
    getDegrees = Provider.of<DegreeProvider>(context,listen: false).getDegree();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const MyAppBar(pageTitle: 'بيان الدرجات'),
      body: FutureBuilder(
        future: getDegrees,
        builder: (ctx, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const LoadingWidget('الرجاء الإنتظار قليلاَ');
          }
          else{
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'المعدل التراكمي: ${Provider.of<AuthProvider>(context,listen: false).student.gpa}',
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            ' المعدل الفصلي: ${currentDegree!.semesterAVG}',
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing:5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1.8,
                        ),
                        itemCount: currentDegree!.subjects.length,
                        itemBuilder: (ctx, index) {
                          return GradesDisplay(
                            nameOfSubject:
                            currentDegree!.subjects[index]['name'],
                            gradeOfSubject:
                            '${currentDegree!.subjects[index]['degree']}',
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenSize.width *0.08),
                    child: const ElementaryButton('طلب البيان', null, null),
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: LevelsList().universityLevels.length,
                      itemBuilder: (ctx, index) => SemesterSelecter(
                          level: LevelsList().universityLevels[index].levelName,
                          bton1Val: "${LevelsList().universityLevels[index].firstSemesterNum}",
                          botn2Val: "${LevelsList().universityLevels[index].secondSemesterNum}",
                          changeSemester: selectSemester),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      )
    );
  }
}
