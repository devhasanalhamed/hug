import 'dart:async';

import 'package:dgfhuss/models/http_exception.dart';
import 'package:dgfhuss/providers/announcement.dart';
import 'package:dgfhuss/widgets/buttons/elementary_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/news.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _userName = '';
  var _password = '';
  var _showPassword = false;
  var _rememberMe = false;
  var _savedName = '';
  var thereIsData = false;
  var isLoading = false;
  final  forgotIDController = TextEditingController();
  final  forgotEmailController = TextEditingController();

  void removeData() {
    _savedName = '';
    _rememberMe = false;
    _password = '';
    _userName = '';
  }

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).getSavedData().then((_) {
      if (Provider.of<AuthProvider>(context, listen: false).id.length == 11) {
        setState(() {
          _rememberMe =
              Provider.of<AuthProvider>(context, listen: false).rememberMe;
          _savedName =
              Provider.of<AuthProvider>(context, listen: false).savedName;
          _userName = Provider.of<AuthProvider>(context, listen: false).id;
          thereIsData = true;
          Provider.of<AuthProvider>(context, listen: false)
              .trySignWithFingerprint();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    Future<void> _onSave() async {
      var allGood = _formKey.currentState!.validate();
      if(allGood){
        _formKey.currentState!.save();
        setState(() {
          isLoading = true;
        });
        Timer(const Duration(seconds: 1), () async{
          try{
            await Provider.of<AuthProvider>(context, listen: false)
                .authLogin(_userName, _password, _rememberMe).then((value) => isLoading = false);
          }
          on HttpException catch(error){
            setState(() {
              isLoading = false;
            });
            showDialog(context: context, builder: (ctx) => AlertDialog(
              title: const Text('حدثت مشكلة!',style: TextStyle(color: Colors.black),textDirection: TextDirection.rtl,),
              content: const Text('تحقق من إتصالك بالإنترنت ومعلومات الحساب'),
              actions: [
                ElevatedButton(child: const Text('موافق'),onPressed: (){
                  Navigator.of(ctx).pop();
                },)
              ],
            ));
          }
        });
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset:
            false, //this will stop the screen resize while showing a keyboard
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(10, 33, 76, 1.0).withOpacity(1),
                      const Color.fromRGBO(24, 61, 121, 1.0).withOpacity(1),
                      const Color.fromRGBO(1, 90, 197, 1.0).withOpacity(1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Container(
                height: _screenSize.height * 0.6,
                width: _screenSize.width,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _screenSize.width * 0.08,
                    ),
                    child: ListView(
                      children: [
                        if (!thereIsData)
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              labelText: "رقم القيد",
                              prefixIcon: Icon(Icons.perm_identity),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            maxLength: 11,
                            onSaved: (value) {
                              if (value != null) {
                                _userName = value;
                              }
                            },
                            validator: (value){
                              if(value!.isEmpty || value.length < 11){
                                return 'رقم القيد غير ملائم';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: "كلمة المرور",
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: Icon(_showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          obscureText: !_showPassword,
                          textAlign: TextAlign.right,
                          onSaved: (value) {
                            if (value != null) {
                              _password = value;
                            }
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'كلمة المرور غير ملائمة';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) => _onSave(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  if (!thereIsData)
                                    const Text(
                                      'تذكرني',
                                      textDirection: TextDirection.rtl,
                                    ),
                                  if (!thereIsData)
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value!;
                                        });
                                      },
                                    )
                                ],
                              ),
                            ),
                            TextButton(
                                child: const Text(
                                  'نسيت كلمة المرور؟',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      title: const Text(
                                        'نسيت كلمة المرور!؟',
                                        textDirection: TextDirection.rtl,
                                      ),
                                      content: SizedBox(
                                        height: _screenSize.height * 0.22,
                                        width: _screenSize.width * 0.8,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller: forgotIDController,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  labelText: "رقم القيد",
                                                ),
                                                  maxLength: 11,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextField(
                                                controller: forgotEmailController,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  labelText: "البريد الجامعي",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('موافق'),
                                          onPressed: () {
                                            // Provider.of<AuthProvider>(context,listen: false).forgotMyPassword(forgotIDController.text, forgotEmailController.text);
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        if(!isLoading)ElementaryButton('تسجيل الدخول', _onSave, null),
                        if(isLoading)const Center(child: CircularProgressIndicator()),
                        if (thereIsData)
                          TextButton(
                            child: const Text('تسجيل مستخدم آخر'),
                            onPressed: () {
                              setState(() {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .removeSavedData();
                                removeData();
                                thereIsData = false;
                              });
                            },
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _screenSize.height * (_savedName.isNotEmpty ? 0.25 : 0.30),
                right: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مرحباً',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                    if (_savedName.isNotEmpty)
                      Text(
                        _savedName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                  ],
                ),
              ),
              Positioned(
                left: 15,
                top: _screenSize.height * 0.1,
                child: Image.asset(
                  'assets/images/hadhramout.png',
                  height: 70,
                  width: 70,
                ),
              ),
            ],
          ),
        ));
  }
}
