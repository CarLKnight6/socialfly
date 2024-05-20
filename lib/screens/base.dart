import 'package:flutter/material.dart';

import '../utils/screen.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom/drawer.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BasePageState<Page extends BaseScreen> extends State<Page> {
  bool _hasBackButton = false;
  bool _hasBottomNavBar = true;

  String? appBarTitle() {
    return null;
  }

  Widget? customAppBarTitle() {
    return null;
  }

  void hasBottomNavBar(bool value) {
    _hasBottomNavBar = value;
  }

  Widget? customAction() {
    return null;
  }

  void hasBackButton(bool value) {
    _hasBackButton = value;
  }

  Widget? floatingActionButton() {
    return null;
  }

  int bottomNavIndex() {
    return 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onBackButtonClick() {}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
}

mixin Base<Page extends BaseScreen> on BasePageState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: appBarTitle() == null && customAppBarTitle() == null
          ? null
          : AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              title: customAppBarTitle() ??
                  Text(
                    appBarTitle() ?? '',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: ScreenUtil.scaleFactor * 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              leading: _hasBackButton
                  ? IconButton(
                      onPressed: onBackButtonClick,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blueAccent,
                        size: ScreenUtil.scaleFactor * 15,
                      ),
                    )
                  : null,
            ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            body(),
          ],
        ),
      ),
      bottomNavigationBar: _hasBottomNavBar
          ? BottomNavigation(
              currentIndex: bottomNavIndex(),
              openDrawer: () => _scaffoldKey.currentState!.openDrawer(),
            )
          : null,
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget body();
}

/* Start Template

import 'package:flutter/material.dart';

class <ClassName> extends BasePage {
const <ClassName>({super.key});
@override
<ClassName>State createState() => <ClassName>State();
}

class <ClassName>State extends BasePageState<<ClassName>> with Base {

@override
Widget body() {
return Container();
}
}

End Template */
