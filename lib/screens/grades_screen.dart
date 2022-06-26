import 'package:dgfhuss/providers/degree.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/buttons/elementary_button.dart';
import 'package:flutter/material.dart';
import '../models/degree_model.dart';
import '../widgets/grades_display.dart';

import 'package:provider/provider.dart';
import '../providers/dummy_data.dart';
import '../models/semesters.dart';

import '../widgets/semester_selecter.dart';


class GradesScreen extends StatefulWidget {
  static String routeName = 'grades_screen';
  const GradesScreen({Key? key}) : super(key: key);

  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  List<DegreesModel> degrees = AppStructure().degreeModels;
  // Initial Selected Value
  int _semesterHandler = 1;

  void selectSemester(val) {
    setState(() {
      _semesterHandler = val;
    });
  }

  DegreesModel? get currentDegree {
    if (degrees.any((element) {
      return element.sheetOrder == _semesterHandler;
    }))
    {
      return degrees.firstWhere((element) {
        return element.sheetOrder == _semesterHandler;
      });
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const MyAppBar(pageTitle: 'بيان الدرجات'),
      body: FutureBuilder(
        future: Provider.of<DegreeProvider>(context,listen: false).getDegree(),
        builder: (ctx, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15)
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'الرجاء الإنتظار قليلاَ'
                      ),
                    ],
                  ),

                ),
              ),
            );
          }
          else{
            return _semesterHandler == 0? const Center(
              child: Text('أختر البيان المطلوب'),
            )
                :Padding(
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
                          const Text(
                            'المعدل التراكمي: 84%',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            currentDegree != null?' المعدل الفصلي: ${currentDegree!.sheetOrder}': 'لا توجد بيانات',
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  currentDegree != null? Expanded(
                    flex: 3,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing:5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1.8,
                        ),
                        itemCount: currentDegree!.degrees.length,
                        itemBuilder: (ctx, index) {
                          return GradesDisplay(
                            nameOfSubject:
                            currentDegree!.degrees.keys.toList()[index],
                            gradeOfSubject:
                            currentDegree!.degrees.values.toList()[index],
                          );
                        }),
                  )
                      : const Text(
                    'لا يوجد تطابق',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _screenSize.width *0.08),
                    child: const ElementaryButton('طلب البيان', null, null),
                  ),
                  // ElevatedButton(
                  //   child: Text(
                  //     'طلب البيان',
                  //     textDirection: TextDirection.rtl,
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  //   onPressed: currentDegree != null?(){
                  //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text('سيتم عرض pdf'))
                  //     );
                  //   }:null,
                  //   style: ElevatedButton.styleFrom(
                  //     fixedSize: Size(MediaQuery.of(context).size.width/2, 50),
                  //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                  //   ),
                  // ),
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
