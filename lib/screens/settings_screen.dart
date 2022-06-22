import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/degree.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'contact_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'الإعدادات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              ListTile(
                onTap: (){
                  Provider.of<AuthProvider>(context,listen: false).logout();
                },
                title: Text('تسجيل الخروج'),
                leading: Icon(FontAwesomeIcons.rightFromBracket),
                trailing: Icon(Icons.keyboard_arrow_left),
              ),
              ElevatedButton(
                onPressed: (){
                  Provider.of<DegreeProvider>(context, listen: false).getDegree();
                },
                child: const Text('تسجيل الخروج'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
