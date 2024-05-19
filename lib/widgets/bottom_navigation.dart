import 'package:flutter/material.dart';

import '../utils/screen.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final VoidCallback openDrawer;
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.openDrawer,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  List<Widget> pages = const [
    // HomeView(),
  ];

  void onTapped(int index) {
    if (index == 1) {
      widget.openDrawer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: ScreenUtil.scaleFactor * 15,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: ScreenUtil.scaleFactor * 15,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: ScreenUtil.scaleFactor * 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            size: ScreenUtil.scaleFactor * 30,
          ),
          label: "Menu",
        ),
      ],
      currentIndex: widget.currentIndex,
    );
  }
}
