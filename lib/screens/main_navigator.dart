import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/todo/todo.dart';
import 'package:flutter_todo/screens/feed/feed.dart';
import 'package:flutter_todo/screens/my_page/my_page.dart';
import 'package:flutter_todo/screens/group/group.dart';


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
    GroupPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              color: Colors.black,
            ),
            label: 'ccc',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_search,
              color: Colors.black,
            ),
            label: 'ddd',
          ),
        ],
      ),
    );
  }
}
