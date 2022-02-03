import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/todo/todo.dart';
import 'package:flutter_todo/screens/feed/feed.dart';
import 'package:flutter_todo/screens/my_page/my_page.dart';
import 'package:flutter_todo/screens/follow/follow.dart';


class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final tabs = [
    FeedPage(),
    TodoPage(),
    MyPage(),
    FollowPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: tabs[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png',
              width: 28,
            ),
            activeIcon: Image.asset('assets/icons/home_active.png',
              width: 28,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/calendar.png',
              width: 28,
            ),
            activeIcon: Image.asset('assets/icons/calendar_active.png',
              width: 28,
            ),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png',
              width: 28,
            ),
            activeIcon: Image.asset('assets/icons/user_active.png',
              width: 28,
            ),
            label: 'my page',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/group.png',
              width: 28,
            ),
            activeIcon: Image.asset('assets/icons/group_active.png',
              width: 28,
            ),
            label: 'follow',
          ),
        ],
      ),
    );
  }
}
