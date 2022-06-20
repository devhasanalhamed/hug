import 'package:flutter/material.dart';

class ElectronicServicesScreen extends StatefulWidget {
  static String routeName = 'electronic_screen';
  const ElectronicServicesScreen({Key? key}) : super(key: key);

  @override
  _ElectronicServicesScreenState createState() => _ElectronicServicesScreenState();
}

class _ElectronicServicesScreenState extends State<ElectronicServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات الإلكترونية'),
        centerTitle: true,
      ),
      body: const Center(child: Text('electronic')),
    );
  }
}
