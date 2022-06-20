import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';
import '../screens/home_page.dart';
import '../screens/news_screen.dart';
import '../screens/notification_screen.dart';

class HomePageWithBottomBar extends StatefulWidget {
  const HomePageWithBottomBar({Key? key}) : super(key: key);

  @override
  State<HomePageWithBottomBar> createState() => _HomePageWithBottomBarState();
}

class _HomePageWithBottomBarState extends State<HomePageWithBottomBar> {
  int _currentPage = 0;
  final _iconSize = 25.0;

  final _pages = const [
    MyHomePage(),
    NewsScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: _pages[_currentPage],
      bottomNavigationBar: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == 0? Colors.blue.withOpacity(0.2):null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _currentPage = 0;
                    });
                  },
                  icon: _currentPage ==0? Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ):Icon(
                    Icons.home_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ),
                  enableFeedback: false,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == 1? Colors.blue.withOpacity(0.2):null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _currentPage = 1;
                    });
                  },
                  icon: _currentPage ==1? Icon(
                    Icons.newspaper,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ):Icon(
                    Icons.newspaper_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ),
                  enableFeedback: false,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == 2? Colors.blue.withOpacity(0.2):null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _currentPage = 2;
                    });
                  },
                  icon: _currentPage ==2? Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ):Icon(
                    Icons.notifications_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ),
                  enableFeedback: false,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == 3? Colors.blue.withOpacity(0.2):null,
                ),
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _currentPage = 3;
                    });
                  },
                  icon: _currentPage ==3? Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ):Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: _iconSize,
                  ),
                  enableFeedback: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
