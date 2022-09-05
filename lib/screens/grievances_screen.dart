import 'package:dgfhuss/models/degree_model.dart';
import 'package:dgfhuss/providers/degree.dart';
import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/dummy_data.dart';

import '../models/appeal.dart';
import '../providers/grievances.dart';

class GrievancesScreen extends StatefulWidget {
  static String routeName = 'submit_appeal_screen';

  const GrievancesScreen({Key? key}) : super(key: key);

  @override
  _GrievancesScreenState createState() => _GrievancesScreenState();
}

class _GrievancesScreenState extends State<GrievancesScreen> {
  late Future getSubjects;
  late List<FinalDegreeModel> extractor;
  var _currentStep = 0;
  var _post = AppealPost('', true, '', AppealType.reSum);
  var _subjectName ='';
  var _grievanceType ='';
  var _reason ='';
  List<AppealElement> appealElemetns = AppStructure().appealElements;

  @override
  void initState() {
    getSubjects = Provider.of<DegreeProvider>(context,listen: false).getDegree();
    extractor = Provider.of<DegreeProvider>(context,listen: false).listOfDegrees;
    super.initState();
  }


  List<dynamic> get validSubjects{
    return extractor.last.subjects;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'طلب تظلم'),
      body: FutureBuilder(
        future: getSubjects,
        builder: (ctx, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const LoadingWidget('الرجاء الإنتظار قليلاَ');
          }
          else {
            List<Step> getSteps = [
              Step(
                isActive: _currentStep >= 0,
                state: _currentStep >= 1? StepState.complete :StepState.indexed,
                title: const Text('أختر من قائمة المواد المتاحة'),
                content: Container(
                  color: Colors.grey.shade200,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'عدد المواد: ${validSubjects.length}',
                              textDirection: TextDirection.rtl,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: validSubjects.length,
                          itemBuilder: (ctx, index) => SizedBox(
                            height: 150,
                            width: 150,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      validSubjects[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18
                                      ),
                                    ),
                                    ElevatedButton(onPressed: (){
                                      setState(() {
                                        _currentStep += 1;
                                        print(validSubjects[index]['name']);
                                        _subjectName = validSubjects[index]['name'];
                                      });
                                    }, child: const Text('إختيار'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                isActive: _currentStep >= 1,
                state: _currentStep >= 2? StepState.complete :StepState.indexed,
                title: const Text('نوع الطلب'),
                content: Row(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _currentStep += 1;
                          print('appeal');
                          _grievanceType = 'فتح دفتر';
                        });
                      },
                      child: const Text('فتح دفتر'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _currentStep += 1;
                          print('resum');
                          _grievanceType = 'جمع درجات';
                        });
                      },
                      child: const Text('جمع درجات'),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: _currentStep >= 2,
                state: _currentStep >= 3? StepState.complete :StepState.indexed,
                title: const Text('الملاحظات'),
                content: TextFormField(
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  maxLength: 200,
                  onChanged: (value){
                    _reason = value;
                  },
                ),
                // state: StepState.editing
              ),
              Step(
                isActive: _currentStep >= 3,
                state: _currentStep >= 4? StepState.complete :StepState.indexed,
                title: const Text('التأكيد'),
                content: Column(
                  children: [
                    Text(_post.name),
                    Text(_post.content),
                    Text(_post.type.toString()),
                    Text(_post.isValid.toString()),
                  ],
                ),
              ),
            ];
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep != 4) {
                    setState(() {
                      _currentStep += 1;
                    });
                  }
                  if (_currentStep == 4) {
                    setState(() {
                      Provider.of<GrievancesProvider>(context,listen: false).postGrievance(
                        subject: _subjectName,
                        degree: '',
                        reason: _reason,
                        type: _grievanceType,
                      );
                      _currentStep = 0;
                    });
                  }
                  else {
                    null;
                  }
                },
                onStepCancel: () {
                  if (_currentStep == 0) {
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      _currentStep -= 1;
                    });
                  }
                },
                controlsBuilder: (ctx, ControlsDetails details) {
                  return _currentStep <=1?Row(
                    children: [
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: Text(_currentStep == 0 ? 'إلغاء' : 'السابق'),
                      ),
                    ],
                  ):Row(
                    children: [
                      TextButton(
                        onPressed: details.onStepContinue,
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(_currentStep == 3 ?  'تأكيد':'التالي'),
                        ),
                      ),
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: Text(_currentStep == 0 ? 'إلغاء' : 'السابق'),
                      ),
                    ],
                  );
                },
                steps: getSteps,
              ),
            );
          }
        }
      )
    );
  }
}

