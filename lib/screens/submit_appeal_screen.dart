import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/dummy_data.dart';

import '../models/appeal.dart';

class SubmitAppealScreen extends StatefulWidget {
  static String routeName = 'submit_appeal_screen';

  const SubmitAppealScreen({Key? key}) : super(key: key);

  @override
  _SubmitAppealScreenState createState() => _SubmitAppealScreenState();
}

class _SubmitAppealScreenState extends State<SubmitAppealScreen> {
  var _currentStep = 0;
  var _post = AppealPost('', true, '', AppealType.reSum);
  List<AppealElement> appealElemetns = AppStructure().appealElements;
  @override
  Widget build(BuildContext context) {
    List<Step> getSteps = [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep >= 1? StepState.complete :StepState.indexed,
        title: const Text('أختر من قائمة المواد المتاحة'),
        content: Container(
          color: Colors.grey.shade200,
          height: 170,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(
                height: 140,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appealElemetns.length,
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
                              appealElemetns[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                _currentStep += 1;
                                print(appealElemetns[index].name);
                                _post = AppealPost(appealElemetns[index].name, true, '', AppealType.reSum);
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
                  _post = AppealPost(_post.name, true, '', AppealType.appeal);
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
                  _post = AppealPost(_post.name, true, '', AppealType.reSum);
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
            _post = AppealPost(_post.name, true, value, _post.type);
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
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'طلب تظلم'),
      body: Directionality(
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
      ),
    );
  }
}

