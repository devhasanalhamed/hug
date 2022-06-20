import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ElevatedButton(
              onPressed: (){
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
              child: const Text('تسجيل الخروج'),
            ),
          ],
        ),
      ),
    );
  }
}
