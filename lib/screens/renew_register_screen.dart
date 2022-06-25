import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:dgfhuss/widgets/buttons/elementary_button.dart';
import 'package:flutter/material.dart';

class RenewRegisterScreen extends StatefulWidget {
  static String routeName = 'renew_register_screen';
  const RenewRegisterScreen({Key? key}) : super(key: key);

  @override
  _RenewRegisterScreenState createState() => _RenewRegisterScreenState();
}

class _RenewRegisterScreenState extends State<RenewRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'تجديد القيد'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/approved.png',
              height: 100,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'رقم القيد : ',
                  style: Theme.of(context).textTheme.headline6,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  '2188481051',
                  style: Theme.of(context).textTheme.headline6,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'حالة القيد: ',
                  style: Theme.of(context).textTheme.headline6,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  'مجدد',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.green,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const ElementaryButton('طلب تجديد',null,Colors.grey),
            const SizedBox(
              height: 10,
            ),
            const ElementaryButton('طلب شهادة تسجيل قيد',null,null),
            // ElevatedButton(
            //   child: Text(
            //     'طلب شهادة تسجيل قيد',
            //     textDirection: TextDirection.rtl,
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: Theme.of(context).colorScheme.secondary,
            //     ),
            //   ),
            //   onPressed: (){
            //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
            //     ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('سيتم عرض pdf'))
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //       fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
            //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}
