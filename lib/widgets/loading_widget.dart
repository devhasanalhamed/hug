import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String text;
  const LoadingWidget(
      this.text,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 150,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(15)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                  text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
