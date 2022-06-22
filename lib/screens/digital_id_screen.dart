import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth.dart';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:barcode/barcode.dart';

import 'package:flip_card/flip_card.dart';

class DigitalCardScreen extends StatefulWidget {
  static String routeName = 'digital-id-screen';
  const DigitalCardScreen({Key? key}) : super(key: key);

  @override
  _DigitalCardScreenState createState() => _DigitalCardScreenState();
}

class _DigitalCardScreenState extends State<DigitalCardScreen> {
  @override
  Widget build(BuildContext context) {
    final _studentData = Provider.of<AuthProvider>(context).student;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: const MyAppBar(pageTitle: 'البطاقة الرقمية'),
      body: FlipCard(
        fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        front: Center(
          child: SizedBox(
            height: 230,
            width: 350,
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(
                textDirection: TextDirection.rtl,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Image.asset(
                      'assets/images/hadhramout.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 80,
                    child: Text(
                      'جامعة حضرموت',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 75,
                    child: Container(
                      height: 25,
                      width: 260,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'نوع القبول - ${_studentData.typeOfRegister}',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 120,
                    top: 55,
                    child: Text(
                      "البطاقة الرقمية",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 80,
                    top: 80,
                    child: Text(
                      _studentData.name,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 105,
                    child: Text(
                      'الكلية: الهندسة والبترول',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 125,
                    child: Text(
                      'التخصص: ${_studentData.department}',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 55,
                    top: 155,
                    child: Text(
                      'رقم القيد: ${_studentData.id}',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 8,
                    child: Container(
                      height: 140,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '2022',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      height: 100,
                      width: 80,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     FittedBox(child: Text('الكلية: الهندسة والبترول')),
                  //     const FittedBox(child: Text(' - ')),
                  //     FittedBox(child: Text('التخصص: هندسة حاسوب')),
                  //   ],
                  // ),
                  // FittedBox(child: Text("رقم القيد: 18020501080")),
                  Positioned(
                    left: 80,
                    bottom: 10,
                    child: SizedBox(
                      height: 40,
                      child: BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        data: '${_studentData.id}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        back: Center(
          child: SizedBox(
            height: 230,
            width: 350,
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(
                textDirection: TextDirection.rtl,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      data: '${_studentData.id}',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
