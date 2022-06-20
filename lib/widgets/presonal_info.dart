import 'package:flutter/material.dart';

class PresonalInfo extends StatelessWidget {
  final String tex;
  final Widget icon;
  const PresonalInfo({Key? key, required this.tex, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              tex,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 20,
            ),
            icon
          ],
        ),
        const Divider(),
      ],
    );
  }
}
