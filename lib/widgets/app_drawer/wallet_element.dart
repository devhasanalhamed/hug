import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 80,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.8,
          ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
           Text('رصيدك الحالي',style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
          ),),
           Text('6700.0',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
           Text('YR',style: TextStyle(
             color: Theme.of(context).colorScheme.primary,
             fontSize: 15,
          ),),

        ],
      ),
    );
  }
}
