import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  final String pageTitle;
  const MyAppBar({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Image.asset(
      //   'assets/images/logo.png'
      // ),
      foregroundColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.primary,
      //leading: const Icon(Icons.person),
      title: Text(
        pageTitle,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      actions: [
        InkWell(
          child: CircleAvatar(
            child: Image.asset('assets/images/hadhramout.png'),
          ),
          onTap: (){
            showDialog(
                context: context,
                builder: (ctx) => const SizedBox(
                  height: 200,
                  child: AlertDialog(

                  ),
                )
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}