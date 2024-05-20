import 'package:flutter/material.dart';
import 'package:social_fly/screens/base.dart';
import 'package:social_fly/utils/screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends BasePageState<HomeScreen> with Base {
  @override
  void initState() {
    super.initState();
    customAction(getActions());
  }

  @override
  String? appBarTitle() {
    return "SOCIALFLY";
  }

  Widget getActions() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: ScreenUtil.safeBlockHorizontal * 2),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.menu,
            size: ScreenUtil.scaleFactor * 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: ScreenUtil.safeBlockHorizontal * 2),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.settings,
            size: ScreenUtil.scaleFactor * 30,
          ),
        ),
      ],
    );
  }

  @override
  Widget body() {
    return Container();
  }
}
