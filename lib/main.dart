// 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
import 'package:dgfhuss/providers/announcement.dart';
import 'package:dgfhuss/providers/calendar.dart';
import 'package:dgfhuss/providers/degree.dart';
import 'package:dgfhuss/providers/grievances.dart';
import 'package:dgfhuss/providers/schedule.dart';
import 'package:dgfhuss/providers/suggestions.dart';
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
import './screens/grievances_screen.dart';
import './screens/renew_register_screen.dart';
import './screens/calender_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( // a listener in the change of Auth state
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CalendarProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SuggestionsProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider,AnnouncementProvider>(
          create: (ctx) => AnnouncementProvider(student: null),
          update: (ctx, auth, announcement) => AnnouncementProvider(student: auth.student),
        ),
        ChangeNotifierProxyProvider<AuthProvider,DegreeProvider>(
          create: (ctx) => DegreeProvider(name: '',id: '',student: null),
          update: (ctx, auth, degree) => DegreeProvider(id: auth.student.id.toString(), name: auth.student.name,student: auth.student),
        ),
        ChangeNotifierProxyProvider<AuthProvider,GrievancesProvider>(
          create: (ctx) => GrievancesProvider(studentCopy: null),
          update: (ctx, auth, grievance) => GrievancesProvider(studentCopy: auth.student),
        ),
        ChangeNotifierProxyProvider<AuthProvider,ScheduleProvider>(
          create: (ctx) => ScheduleProvider(studentCopy: null),
          update: (ctx, auth, schedule) => ScheduleProvider(studentCopy: auth.student),
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
          home: auth.isAuth? const HomePageWithBottomBar():const LogInScreen(),
          // auth.isAuth? const HomePageWithBottomBar():const LogInScreen()
      routes: {
        ProfileScreen.routeName : (ctx) => const ProfileScreen(),
        NewsScreen.routeName : (ctx) => const NewsScreen(),
        NewsViewer.routeName : (ctx) => const NewsViewer(),
        ElectronicServicesScreen.routeName : (ctx) => const ElectronicServicesScreen(),
        GradesScreen.routeName : (ctx) => const GradesScreen(),
        ManualScreen.routeName : (ctx) => const ManualScreen(),
        SettingsScreen.routeName : (ctx) => const SettingsScreen(),
        GrievancesScreen.routeName : (ctx) => const GrievancesScreen(),
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

