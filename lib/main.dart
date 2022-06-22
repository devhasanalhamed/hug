
import 'package:dgfhuss/providers/degree.dart';
import 'package:flutter/material.dart'; //package that provide widgets (Google)
import 'package:flutter/services.dart';

import 'package:provider/provider.dart'; //package to manage state of data (Google)
import './providers/auth.dart';
import './providers/news.dart';

import './screens/home_page_with_bottom_bar.dart';
import './screens/login_Screen.dart';
import './screens/news_screen.dart';
import './screens/electronic_services_screen.dart';
import './screens/grades_screen.dart';
import './screens/settings_screen.dart';
import './screens/manual_screen.dart';
import './screens/profile_screen.dart';
import './screens/submit_appeal_screen.dart';
import './screens/renew_register_screen.dart';
import './screens/university_calender_screen.dart';
import './screens/schedule_screen.dart';
import './screens/notification_screen.dart';
import './screens/news_viewer.dart';
import './screens/digital_id_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    ThemeData myTheme = ThemeData() ;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( // a listener in the change of Auth state
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NewsProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider,DegreeProvider>(
          create: (ctx) => DegreeProvider(name: '',id: ''),
          update: (ctx, auth, degree) => DegreeProvider(id: auth.student.id.toString(), name: auth.student.name),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HUG',
          theme: ThemeData(
            fontFamily: 'Tajawal',
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(24, 61, 121, 1),
              secondary: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        // textTheme: const TextTheme(
        //   bodyText2: TextStyle( // this cause the white text on the screen
        //     fontFamily: 'Cairo',
        //   ),
        // ),
        //   subtitle1: TextStyle(
        //     color: Color.fromRGBO(255, 255, 255, 1.0),
        //     fontFamily: 'Cairo',
        //     fontSize: 20,
        //   ),
        //   bodyText1: TextStyle(
        //     color: Color.fromRGBO(10, 33, 76, 1.0),
        //     fontFamily: 'Cairo',
        //   ),
        //   subtitle2: TextStyle(
        //     color: Color.fromRGBO(84, 189, 55, 1.0),
        //     fontFamily: 'Cairo',
        //     fontSize: 15,
        //   ),
        //   headline1: TextStyle( //head lines for the news
        //     color: Color.fromRGBO(255, 255, 255, 1.0),
        //     fontFamily: 'Cairo',
        //     fontWeight: FontWeight.bold,
        //     fontSize: 18,
        //   ),
        //   headline2: TextStyle( //content lines for the news
        //     color: Color.fromRGBO(255, 255, 255, 1.0),
        //     fontFamily: 'Cairo',
        //     fontSize: 12,
        //   ),
        //   headline6: TextStyle( //this will be for grades screen and register screen
        //     color: Color.fromRGBO(10, 33, 76, 1.0),
        //     fontFamily: 'Cairo',
        //     fontSize: 16,
        //   ),
        // ),
        // iconTheme: Theme.of(context).iconTheme.copyWith(
        //     color: const Color.fromRGBO(10, 33, 76, 1.0),
        //     size: 30,
        //     opacity: 1
        // ),
        // scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
          home:  auth.isAuth? HomePageWithBottomBar(): LogInScreen(),
      routes: {
        ProfileScreen.routeName : (ctx) => const ProfileScreen(),
        NewsScreen.routeName : (ctx) => const NewsScreen(),
        NewsViewer.routeName : (ctx) => const NewsViewer(),
        ElectronicServicesScreen.routeName : (ctx) => const ElectronicServicesScreen(),
        GradesScreen.routeName : (ctx) => const GradesScreen(),
        ManualScreen.routeName : (ctx) => const ManualScreen(),
        SettingsScreen.routeName : (ctx) => const SettingsScreen(),
        SubmitAppealScreen.routeName : (ctx) => const SubmitAppealScreen(),
        RenewRegisterScreen.routeName: (ctx) => const RenewRegisterScreen(),
        UniversityCalenderScreen.routeName: (ctx) => const UniversityCalenderScreen(),
        ScheduleScreen.routeName: (ctx) => const ScheduleScreen(),
        NotificationScreen.routeName: (ctx) => const NotificationScreen(),
        DigitalCardScreen.routeName: (ctx) => const DigitalCardScreen(),
      },
    ),
      ),
    );
  }
}

