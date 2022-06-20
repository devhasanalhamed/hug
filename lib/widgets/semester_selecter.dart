import 'package:flutter/material.dart';

class SemesterSelecter extends StatelessWidget {
  final String level, bton1Val, botn2Val;
  final Function changeSemester;
  const SemesterSelecter(
      {Key? key,
        required this.level,
        required this.bton1Val,
        required this.botn2Val,
        required this.changeSemester})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      width: 130,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            level,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SelecterButton(displayVal: bton1Val, newVal: changeSemester),
              SelecterButton(
                displayVal: botn2Val,
                newVal: changeSemester,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelecterButton extends StatelessWidget {
  final String displayVal;
  final newVal;
  const SelecterButton({
    Key? key,
    required this.displayVal,
    required this.newVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.square(45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () => newVal(int.parse(displayVal)),
        child: Text(displayVal));
  }
}
