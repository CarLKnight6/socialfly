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
    // if (index == 1) {
    //   widget.openDrawer();
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => pages[index]),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffebc591),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil.safeBlockHorizontal * 2),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
        ),
        child: BottomNavigationBar(
          onTap: onTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xffebc591),
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil.scaleFactor * 15,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil.scaleFactor * 15,
          ),
          items: [
            customNavigationBarItem(Icons.home, "HOME"),
            customNavigationBarItem(Icons.notifications_none, "NOTIFICATION"),
            customNavigationBarItem(Icons.video_collection_outlined, "LIVE"),
            customNavigationBarItem(Icons.message_rounded, "MESSAGE"),
            customNavigationBarItem(Icons.movie_edit, "REELS"),
            customNavigationBarItem(Icons.person_outline, "PROFILE"),
          ],
          currentIndex: widget.currentIndex,
        ),
      ),
    );
  }
}

customNavigationBarItem(IconData iconData, String label) {
  return BottomNavigationBarItem(
    icon: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: ScreenUtil.scaleFactor * 40,
        color: Colors.black,
      ),
    ),
    label: label,
  );
}
