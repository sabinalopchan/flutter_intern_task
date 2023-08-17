import 'package:flutter/material.dart';
import 'package:flutter_intern_task/home_page.dart';

class BottmNavigation extends StatefulWidget {
  const BottmNavigation({super.key});

  @override
  State<BottmNavigation> createState() => _BottmNavigationState();
}

class _BottmNavigationState extends State<BottmNavigation> {
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: CustomTheme.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SizedBox(height: 24.0),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  // Screens for each menu option
                  HomePage(),
                  HomePage(),
                  HomePage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Color(0xFF7F56D9),
        unselectedItemColor: const Color.fromARGB(255, 131, 127, 127),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ballot_rounded),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
