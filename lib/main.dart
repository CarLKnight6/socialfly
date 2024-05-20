import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:social_fly/screens/splash.dart';
import 'package:social_fly/utils/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDHFeyCdtzTgXxFnny_X2eNjkL3omnMF8U',
      appId: '1:18184940555:android:ffd881f9955c4eaa4f2b0e',
      messagingSenderId: '18184940555',
      projectId: 'socialfly-595b3',
    ),
  );
  // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  ScreenUtil.init();
  runApp(const SocialFly());
}

class SocialFly extends StatelessWidget {
  const SocialFly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {}
