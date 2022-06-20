import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/schedule.dart';
import '../screens/digital_id_screen.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:intl/intl.dart';

import '../models/advertise.dart';
import '../models/appeal.dart';
import '../screens/news_screen.dart';
import '../screens/electronic_services_screen.dart';
import '../screens/grades_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/manual_screen.dart';
import '../screens/submit_appeal_screen.dart';
import '../screens/renew_register_screen.dart';
import '../screens/university_calender_screen.dart';
import '../screens/schedule_screen.dart';
import '../screens/notification_screen.dart';

import '../models/drawer_list_tile.dart';
import '../models/home_page_element.dart';
import '../models/news.dart';
import '../models/degree_model.dart';
import '../models/university_calendar.dart';

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
      routeName: SubmitAppealScreen.routeName,
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
        title: 'تدشين تطبيق جامعة حضرموت',
        content: 'قام الطلاب الأربعة هاله بن هلابي، مرعي بن طالب، عبد الرحمن بهيان، و حسن الحامد بإطلاق التطبيق الرسمي لجامعة حضرموت تحت إشراف الدكتورة القديرة سهام بامطرف وقد أشاد عميد الكلية بكلمة تخللها الشكر والثناء على من لقبهم ب فخر جامعة حضرموت والنموذج المثالي للطالب الحضرمي.',
        imageLink: 'assets/images/news1.jpg',
      publishDate: DateTime.now(),
    ),
    NewsModel(
      title: 'دورة بعنوان: المعمل والإجراء',
      content: "برعاية الأستاذ الدكتور/ محمد سعيد خنبش رئيس جامعة حضرموت، والعميد/ سعيد بن دويس العوبثاني مدير أمن ساحل حضرموت، وفي ضمن برنامج (شراع)؛ أقام المنتدى السياسي لطلاب جامعة حضرموت الحقيبة التدريبية بعنوان: المعمل والإجراء الجنائي، بالشراكة مع إدارة التوجيه المعنوي والعلاقات العامة، صباح اليوم الاثنين بقاعة الفقيد اللواء/ سعيد أحمد المحمدي، والتي تستمر لمدة أربعة أيام من 21_24 فبراير.",
      imageLink: 'assets/images/news4.jpg',
      publishDate: DateTime.now(),
    ),

    NewsModel(
      title: 'اجتماع رؤساء لجان أسبوع البحث العلمي',
      content: 'عقدت اللجنة العليا لأسبوع البحث العلمي الثاني بجامعة حضرموت صباح اليوم اجتماعها الثاني برئاسة الأستاذ الدكتور محمد سعيد خنبش رئيس الجامعة، وبحضور نواب رئيس الجامعة، ورؤساء اللجان الخاصة.',
      imageLink: 'assets/images/news3.jpg',
      publishDate: DateTime.now(),

    ),
    NewsModel(
      title: 'اللجنة تعقد إجتماعا دوريا',
      content: 'عقدت لجنة الخطة الإستراتيجية الثانية لجامعة حضرموت اجتماعًا دوريًّا برئاسة الأستاذ الدكتور محمد سعيد خنبش رئيس الجامعة، صباح الثلاثاء الأول من مارس ٢٠٢٢، استعرض الاجتماع نتائج اللجان المختصة بالقطاعات المختلفة في الجامعة، وقدَّم رؤساء القطاعات عرضًا لما توصلت إليه اللجان في نقاشاتها التي تمخضت عن بلورة الأهداف وتحويلها إلى مصفوفة برامج ومشاريع تكون مسودة نهائية لرسم إستراتيجية الجامعة ٢٠٣٠.',
      imageLink: 'assets/images/news2.jpg',
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

  List<UniversityCalendarElement> universityCalendar= [
    UniversityCalendarElement('إستنئاف الفصل الدراسي الأول', DateTime.utc(2022,1,15), Semester.first),
    UniversityCalendarElement('إنتهاء الفصل الدراسي الأول', DateTime.utc(2022,3,17), Semester.first),
    UniversityCalendarElement('إختبارات الفصل الدراسي الأول', DateTime.utc(2022,3,31), Semester.first),
  ];
  
  List<ScheduleElement> scheduleElements = [
    ScheduleElement('Artificial Intelligent', 'د. رشا بن ثعلب', 8,'ص', 10,'ص', 'D203', Days.sunday),
    ScheduleElement('Computer Network', 'د. مكارم بامطرف', 10,'ص', 12,'م', 'D203', Days.sunday),
    ScheduleElement('VLSI Circuit Design Lab', 'أ. وفاء', 8,'ص', 10,'ص', 'D204', Days.monday),
    ScheduleElement('Artificial Intelligent Lab', 'م. عصمت', 10,'ص', 12,'م', 'B202', Days.monday),
    ScheduleElement('Data Security Lab', 'أ. فاطمة بافرج', 12,'م', 2,'م', 'A204', Days.monday),
    ScheduleElement('Real-Time Computer Control Lab', 'م. علاء باسواقي', 8,'ص', 10,'ص', 'A204', Days.tuesday),
    ScheduleElement('Computer Network', 'د. مكارم بامطرف', 8,'ص', 10,'ص', 'C203', Days.wednesday),
    ScheduleElement('Real-Time Computer Control', 'م. علاء باسواقي', 8,'ص', 10,'ص', 'C203', Days.thursday),
    ScheduleElement('Data Security', 'د. مكارم بامطرف', 10,'ص', 12,'م', 'C202', Days.thursday),
    ScheduleElement('VLSI Circuit Design', 'د. خالد فوزي', 12,'م', 2,'م', 'C203', Days.thursday),
  ];

  List<Advertise> addsList = [
    Advertise('يوم المهندس!', 'تقام فعاليات عيد المهندس اليوم !!')
  ];

  List<AppealElement> appealElements = [
    AppealElement('Computer Graphics', AppealType.reSum),
    AppealElement('Computer Network', AppealType.reSum),
    AppealElement('Artificial Economy', AppealType.reSum),
    AppealElement('Check or do not Check', AppealType.reSum),
  ];

}

