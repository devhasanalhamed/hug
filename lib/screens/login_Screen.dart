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

  @override
  void initState() {
    print('initState');
    Provider.of<AuthProvider>(context,listen: false).getSavedData().then((_){
      setState(() {
        _rememberMe = Provider.of<AuthProvider>(context,listen: false).rememberMe;
        _savedName = Provider.of<AuthProvider>(context,listen: false).savedName;
        _userName = Provider.of<AuthProvider>(context,listen: false).id;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;
  void _onSave(){
    _formKey.currentState!.save();
    Provider.of<AuthProvider>(context, listen: false).authLogin(_userName, _password, _rememberMe);
    Provider.of<NewsProvider>(context, listen: false).getNews();
  }

    return Scaffold(
      resizeToAvoidBottomInset: false, //this will stop the screen resize while showing a keyboard
      body: Directionality(
        textDirection: TextDirection.rtl ,
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
                  // stops: const [0, 1],
                ),
              ),
              // child: Column(
              //   children: [
              //     // Image.asset('assets/images/hadhramout.png')
              //   ],
              // ),
              // child: WeatherBg(width: 100,height: 100,weatherType: WeatherType.sunnyNight),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ListView(
                    children: [
                      if(_userName.isEmpty)TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: "رقم القيد",
                          prefixIcon: Icon(Icons.perm_identity),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        onSaved: (value){
                          if (value != null){
                            _userName = value;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: "كلمة المرور",
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: Icon(_showPassword? Icons.visibility_off: Icons.visibility),
                          ),
                        ),
                        obscureText: !_showPassword,
                        textAlign: TextAlign.right,
                        onSaved: (value){
                          if (value != null){
                            _password = value;
                          }
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
                                const Text(
                                  'تذكرني',
                                  textDirection: TextDirection.rtl,
                                ),
                                Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value){
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              'هل تواجه مشكله؟',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                              ),
                            ),
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: const Text(
                                    'تحقق من التالي:',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  content: SizedBox(
                                    height: 120,
                                    child: Column(
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          '1- إتصالك بالإنترنت',
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Text(
                                          '2- رقم القيد أو كلمة المرور',
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Text(
                                          '3- مختص بوابة الخدمات',
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text(
                                        'حسناً'
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                          Size(
                            _screenSize.width,
                            55.0,),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          )
                        ),
                        onPressed: _onSave,
                        child: const Text('تسجيل الدخول'),
                      ),
                      if(_userName.isNotEmpty)TextButton(
                        child: const Text('تسجيل مستخدم آخر'),
                        onPressed: (){
                          setState(() {
                            _userName = '';
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
              top: _screenSize.height *  (_savedName.isNotEmpty?0.25: 0.30),
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'مرحباً',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  if(_savedName.isNotEmpty)
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
      )
    );
  }
}
