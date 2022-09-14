import 'package:dgfhuss/providers/auth.dart';
import 'package:dgfhuss/providers/degree.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/buttons/elementary_button.dart';
import 'package:dgfhuss/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '../models/degree_model.dart';
import '../widgets/confirm_widget.dart';
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
  final nothing = "لا يوجد";
  late Future getDegrees;
  void selectSemester(val) {
    setState(() {
      _semesterHandler = val;
    });
  }

  FinalDegreeModel? get currentDegree {
    return Provider.of<DegreeProvider>(context, listen: false)
        .listOfDegrees
        .firstWhere((element) => element.semesterOrder == _semesterHandler,
        orElse: () => FinalDegreeModel(
            levelName: "null",
            semesterName: "null",
            semesterAVG: "null",
            subjects: [null],
            semesterOrder: 0));
  }

  @override
  void initState() {
    getDegrees =
        Provider.of<DegreeProvider>(context, listen: false).getDegree();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _student = Provider.of<AuthProvider>(context,listen: false).student.wallet;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: const MyAppBar(pageTitle: 'بيان الدرجات'),
        body: FutureBuilder(
          future: getDegrees,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget('الرجاء الإنتظار قليلاَ');
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'المعدل التراكمي: ${Provider.of<AuthProvider>(context, listen: false).student.gpa}',
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              ' المعدل الفصلي: ${currentDegree!.semesterOrder == 0 ? nothing : currentDegree!.semesterAVG}',
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
                      child: currentDegree!.semesterOrder == 0
                          ? const Text("لا يوجد بيانات لهذه الصفحة")
                          : GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1.8,
                          ),
                          itemCount: currentDegree!.subjects.length,
                          itemBuilder: (ctx, index) {
                            return GradesDisplay(
                              nameOfSubject: currentDegree!.subjects[index]
                              ['name'],
                              gradeOfSubject:
                              '${currentDegree!.subjects[index]['degree']}',
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _screenSize.width *0.08),
                      child: ElementaryButton(
                        'طلب البيان',
                            (){
                              if(_student<200){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('رصيدك غير كافي'),
                                  ),
                                );
                              }
                              else{
                                showDialog(
                                  context: (ctx),
                                  builder: (ctx) => ConfirmWidget(
                                        (){
                                      Provider.of<DegreeProvider>(context,listen: false).getGradesPDF(currentDegree!.subjects).then(
                                              (_){
                                            Provider.of<AuthProvider>(context,listen: false).updateWallet();
                                          }
                                      );
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('جاري تنزيل الملف'),
                                        ),
                                      );
                                    },
                                    200,
                                    'بيان الدرجات',
                                  ),
                                );
                              }
                        },
                        null,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: LevelsList().universityLevels.length,
                        itemBuilder: (ctx, index) => SemesterSelecter(
                            level:
                            LevelsList().universityLevels[index].levelName,
                            bton1Val:
                            "${LevelsList().universityLevels[index].firstSemesterNum}",
                            botn2Val:
                            "${LevelsList().universityLevels[index].secondSemesterNum}",
                            changeSemester: selectSemester),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
