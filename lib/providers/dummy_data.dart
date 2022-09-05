import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/schedule.dart';
import '../screens/digital_id_screen.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:intl/intl.dart';

import '../models/announcement_model.dart';
import '../models/appeal.dart';
import '../screens/news_screen.dart';
import '../screens/electronic_services_screen.dart';
import '../screens/grades_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/manual_screen.dart';
import '../screens/grievances_screen.dart';
import '../screens/renew_register_screen.dart';
import '../screens/calender_screen.dart';
import '../screens/schedule_screen.dart';
import '../screens/notification_screen.dart';

import '../models/drawer_list_tile.dart';
import '../models/home_page_element.dart';
import '../models/news.dart';
import '../models/degree_model.dart';
import '../models/calendar.dart';

class AppStructure {
  List<DrawerListTileStructure> drawerElements = [

    DrawerListTileStructure(
      name: 'الملف الشخصي',
      leadIcon: const Icon(Icons.chevron_left,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.person,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: ProfileScreen.routeName,
    ),
    DrawerListTileStructure(
      name: 'الأخبار',
      leadIcon: const Icon(Icons.chevron_left,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.notes,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: NewsScreen.routeName,
    ),
    DrawerListTileStructure(
      name: 'الخدمات الإلكترونية',
      leadIcon: const Icon(Icons.chevron_left,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.document_scanner,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: ElectronicServicesScreen.routeName,
    ),
    DrawerListTileStructure(
      name: 'دليل المستخدم',
      leadIcon: const Icon(Icons.chevron_left,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.menu_book,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: ManualScreen.routeName,
    ),
    DrawerListTileStructure(
      name: 'تواصل معنا',
      leadIcon: const Icon(Icons.chevron_left,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.phone,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: SettingsScreen.routeName,
    ),
    DrawerListTileStructure(
      name: 'تسجيل الخروج',
      leadIcon: const Icon(Icons.logout,color: Color.fromRGBO(17, 22, 51, 1.0),),
      trailIcon: const Icon(Icons.circle,color: Color.fromRGBO(17, 22, 51, 1.0),),
      routeName: SettingsScreen.routeName,
    ),
  ];

  List<GridElement> homePageElement = [
    // GridElement(
    //   name: 'الأخبار',
    //   icon: FontAwesomeIcons.rss,
    //   routeName: NewsScreen.routeName,
    //   color: Colors.yellow
    // ),
    GridElement(
      name: 'بيان الدرجات',
      icon: FontAwesomeIcons.fileLines,
      routeName: GradesScreen.routeName,
      color: Colors.red,
    ),
    GridElement(
      name: 'طلب تظلم',
      icon: FontAwesomeIcons.scaleBalanced,
      routeName: GrievancesScreen.routeName,
      color: Colors.green,
    ),
    GridElement(
      name: 'القيد الجامعي',
      icon: FontAwesomeIcons.buildingColumns,
      routeName: RenewRegisterScreen.routeName,
      color: Colors.blue,
    ),
    GridElement(
      name: 'التقويم الجامعي',
      icon: FontAwesomeIcons.calendar,
      routeName: UniversityCalenderScreen.routeName,
      color: Colors.yellow,
    ),
    GridElement(
      name: 'الجدول الدراسي',
      icon: FontAwesomeIcons.book,
      routeName: ScheduleScreen.routeName,
      color: Colors.orange,
    ),
    // GridElement(
    //   name: 'الإعلانات',
    //   icon: FontAwesomeIcons.bullhorn,
    //   routeName: NotificationScreen.routeName,
    //   color: Colors.deepPurple,
    // ),
    GridElement(
      name: 'البطاقة الرقمية',
      icon: FontAwesomeIcons.idBadge,
      routeName: DigitalCardScreen.routeName,
      color: Colors.pink
    ),
  ];

  List<NewsModel> newsElement = [
    NewsModel(
        title: 'برعاية فخامة رئيس الجمهورية: جامعة حضرموت تحتفي بتكريم أوائل الخريجين والحائزين على مرتبة الشرف من مختلف كليات الجامعة للعام الجامعي 2020 – 2021 م',
        content: 'نظمت جامعة حضرموت بقاعة الفقيد علي هود باعباد بديوان رئاسة الجامعة حفل التخرج السنوي لتكريم أوائل الخريجين والحائزين على مرتبة الشرف في جميع التخصصات بكليات الجامعة المختلفة، وذلك برعاية كريمة من فخامة الأخ المشير عبدربه منصور هادي رئيس الجمهورية.',
        imageLink: 'assets/images/new1.jpg',
      publishDate: DateTime.now(),
    ),
    NewsModel(
      title: 'برئاسة رئيس الجامعة: اجتماع رؤساء لجان أسبوع البحث العلمي الثاني',
      content: "عقدت اللجنة العليا لأسبوع البحث العلمي الثاني بجامعة حضرموت صباح اليوم اجتماعها الثالث برئاسة الأستاذ الدكتور محمد سعيد خنبش رئيس الجامعة، وبحضور نواب رئيس الجامعة، ورؤساء اللجان الخاصة. ناقش الاجتماع الاستعدادات النهائية لانطلاق فعاليات أسبوع البحث العلمي الثاني بجامعة حضرموت الثلاثاء المقبل 15مارس بحفل الافتتاح الذي بحضور السلطة المحلية بحضرموت وعدد من قيادات الجامعة وعمداء الكليات ونوابهم وروساء الأقسام العلمية ورؤساء المراكز العلمية والباحثين والطلاب.",
      imageLink: 'assets/images/new2.jpg',
      publishDate: DateTime.now(),
    ),

    NewsModel(
      title: 'نحو شراكة فاعلة بين الجامعتين: لقاء مهم عبر تقنية الزوم بين رئيس جامعة حضرموت ونائب رئيس جامعة بتروناس تكنولوجي الماليزية',
      content: 'ترأس الأستاذ الدكتور محمد سعيد خنبش رئيس جامعة حضرموت صباح هذا اليوم الموافق ٨ مارس العام ٢٠٢٢م، والأستاذ الدكتور إبراهيم عبدالمطلب نائب رئيس جامعة بتروناس تكنولوجي الماليزية، اللقاء المهم والجامع لأعمال اللجان المشتركة بين الجامعتين، عبر تقنية الزوم. وقد تمخض اللقاء عن جُملة من البنود والتوصيات تنفيذًا للاتفاقية المبرمة بين الجامعتين.',
      imageLink: 'assets/images/new3.jpg',
      publishDate: DateTime.now(),

    ),
  ];

  List<DegreesModel> degreeModels = [
    DegreesModel(
      name: 'بيان درجات للطلاب الغير خريجين',
      degrees: {
        'رياضيات 1':'109',
        'هيكلة بيانات':'116',
        'تصميم منطقي':'146',
        'إشارات ونظم':'60',
        'تصميم مواقع الإنترنت':'144',
        'دوائر إلكترونية':'112',
      },
      sheetOrder: 1,
    ),
    DegreesModel(
      name: 'بيان درجات للطلاب الغير خريجين',
      degrees: {
        'رياضيات 2':'109',
        'هيكلة بيانات':'116',
        'تصميم منطقي':'146',
        'إشارات ونظم':'60',
        'تصميم مواقع الإنترنت':'144',
        'دوائر إلكترونية':'112',
      },
      sheetOrder: 2,
    ),
    DegreesModel(
      name: 'بيان درجات للطلاب الغير خريجين',
      degrees: {
        'رياضيات 3':'109',
        'هيكلة بيانات':'116',
        'تصميم منطقي':'146',
        'إشارات ونظم':'60',
        'تصميم مواقع الإنترنت':'144',
        'دوائر إلكترونية':'112',
      },
      sheetOrder: 3,
    ),
    DegreesModel(
        name: 'بيان درجات للطلاب الغير خريجين',
        degrees: {
          'رياضيات 4':'109',
          'هيكلة بيانات':'116',
          'تصميم منطقي':'146',
          'إشارات ونظم':'60',
          'تصميم مواقع الإنترنت':'144',
          'دوائر إلكترونية':'112',
        },
        sheetOrder: 4,
    ),
    DegreesModel(
      name: 'بيان درجات للطلاب الغير خريجين',
      degrees: {
        'مبادئ قواعد البيانات':'120',
        'مبادئ أنظمة الإتصالات':'125',
        'إلكترونيات رقمية':'135',
        'برمجة موجهة للموضوع':'128',
        'نظم وسيطرة':'131',
        'تنظيم الحواسيب':'109',
      },
      sheetOrder: 5,
    ),
    DegreesModel(
        name: 'بيان درجات للطلاب الغير خريجين',
        degrees: {
          'معمارية حاسوب':'132',
          'هندسة برمجيات':'136',
          'إحصاء و إحتمالات':'120',
          'معالجات دقيقة':'131',
          'قياسات إلكترونية':'111',
          'أنظمة تشغيل':'122',
        },
        sheetOrder: 6,
    ),
  ];



  List<AppealElement> appealElements = [
    AppealElement('Computer Graphics', AppealType.reSum),
    AppealElement('Computer Network', AppealType.reSum),
    AppealElement('Artificial Economy', AppealType.reSum),
    AppealElement('Check or do not Check', AppealType.reSum),
  ];

}

