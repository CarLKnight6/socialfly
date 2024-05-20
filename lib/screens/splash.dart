import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fly/screens/auth/login.dart';
import 'package:social_fly/widgets/bottom_actions.dart';

import '../utils/screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: ScreenUtil.safeBlockVertical * 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: ScreenUtil.safeBlockVertical * 32,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff5ddb5), Color(0x40f5ddb5)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil.safeBlockVertical * 2,
                    horizontal: ScreenUtil.safeBlockHorizontal,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'WELCOME TO SOCIALFLY\nA SOCIAL MEDIA NETWORK',
                        style: TextStyle(
                          fontSize: ScreenUtil.scaleFactor * 30,
                          color: const Color(0xfffc3131),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'MEET NEW PEOPLE, CHAT, GO LIVE',
                        style: TextStyle(
                          fontSize: ScreenUtil.scaleFactor * 24,
                          color: const Color(0xffcc6ce7),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: ScreenUtil.safeBlockVertical * 2),
                width: double.infinity,
                height: ScreenUtil.safeBlockVertical * 35,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfff5ddb5), Color(0xaaf5ddb5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil.safeBlockHorizontal * 2,
                          ),
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.all(
                                ScreenUtil.safeBlockHorizontal * 2,
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(ScreenUtil.safeBlockHorizontal),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.mail,
                              color: Colors.white,
                              size: ScreenUtil.scaleFactor * 48,
                            ),
                            label: Text(
                              'LOGIN OR SIGNUP WITH EMAIL',
                              style: TextStyle(
                                fontSize: ScreenUtil.scaleFactor * 20,
                                color: Colors.white,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.safeBlockVertical,
                        ),
                        Divider(
                          indent: ScreenUtil.safeBlockHorizontal * 5,
                          endIndent: ScreenUtil.safeBlockHorizontal * 5,
                          thickness: ScreenUtil.safeBlockHorizontal,
                          color: const Color(0xff935736),
                        ),
                        Text(
                          'OR SIGNUP OR LOGIN WITH',
                          style: TextStyle(
                            fontSize: ScreenUtil.scaleFactor * 26,
                            color: const Color(0xffcc6ce7),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        socialLogo('assets/logos/google.png', 'GOOGLE'),
                        // socialLogo('assets/logos/apple.png', 'APPLE'),
                        // socialLogo('assets/logos/facebook.png', 'FACEBOOK'),
                        // socialLogo('assets/logos/yahoo.png', 'YAHOO'),
                        // socialLogo('assets/logos/microsoft.png', 'MICROSOFT'),
                      ],
                    ),
                    const BottomActions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

socialLogo(String path, String name) {
  return Column(
    children: [
      Image.asset(
        path,
        width: ScreenUtil.safeBlockHorizontal * 13,
      ),
      SizedBox(
        height: ScreenUtil.safeBlockVertical,
      ),
      Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil.scaleFactor * 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
