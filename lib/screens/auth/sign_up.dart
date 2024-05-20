import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_fly/models/socialfly_user.dart';
import 'package:social_fly/repositories/auth.dart';
import 'package:social_fly/repositories/interfaces/auth.dart';
import 'package:social_fly/screens/auth/login.dart';
import 'package:social_fly/screens/dashboard/home.dart';

import '../../utils/screen.dart';
import '../../widgets/bottom_actions.dart';
import '../../widgets/custom/elevated_button.dart';
import '../../widgets/custom/text_form_field.dart';
import '../base.dart';

class SignUpScreen extends BaseScreen {
  const SignUpScreen({super.key});
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends BasePageState<SignUpScreen> with Base {
  final formKey = GlobalKey<FormState>();
  SocialflyUser user = SocialflyUser();
  TextEditingController passwordController = TextEditingController();
  late StreamSubscription<User?> authSubscription;
  IAuthRepository authRepository = AuthRepository();
  @override
  void initState() {
    super.initState();
    hasBottomNavBar(false);
    listenUser();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  listenUser() async {
    authSubscription = authRepository.authStateChanges.listen((event) async {
      if (event != null) {
        user.uid = event.uid;
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget body() {
    return SingleChildScrollView(
      child: Container(
        height: ScreenUtil.safeBlockVertical * 100,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil.safeBlockHorizontal * 2,
          vertical: ScreenUtil.safeBlockVertical * 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SOCIALFLY EMAIL SIGNUP',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: ScreenUtil.scaleFactor * 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xfffa3030),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail,
                        size: ScreenUtil.scaleFactor * 50,
                      ),
                      SizedBox(
                        width: ScreenUtil.safeBlockHorizontal,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          onChanged: (value) {
                            user.email = value;
                          },
                          fontSize: ScreenUtil.scaleFactor * 15,
                          borderRadius: 0,
                          horizontalPadding: ScreenUtil.safeBlockHorizontal * 2,
                          label: "INPUT YOUR EMAIL HERE",
                          borderColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        size: ScreenUtil.scaleFactor * 50,
                      ),
                      SizedBox(
                        width: ScreenUtil.safeBlockHorizontal,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          controller: passwordController,
                          fontSize: ScreenUtil.scaleFactor * 15,
                          borderRadius: 0,
                          horizontalPadding: ScreenUtil.safeBlockHorizontal * 2,
                          label: "CREATE PASSWORD HERE",
                          borderColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        size: ScreenUtil.scaleFactor * 50,
                      ),
                      SizedBox(
                        width: ScreenUtil.safeBlockHorizontal,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          onValidate: (value) {
                            if (passwordController.text != value || value!.isEmpty) return '';
                            return null;
                          },
                          fontSize: ScreenUtil.scaleFactor * 15,
                          borderRadius: 0,
                          horizontalPadding: ScreenUtil.safeBlockHorizontal * 2,
                          label: "CONFIRM PASSWORD HERE",
                          borderColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: ScreenUtil.scaleFactor * 50,
                      ),
                      SizedBox(
                        width: ScreenUtil.safeBlockHorizontal,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          onChanged: (value) {
                            user.username = value;
                          },
                          fontSize: ScreenUtil.scaleFactor * 15,
                          borderRadius: 0,
                          horizontalPadding: ScreenUtil.safeBlockHorizontal * 2,
                          label: "CREATE USERNAME HERE",
                          borderColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 3,
                  ),
                  CustomElevatedButton(
                    buttonColor: const Color(0xffcbcdc9),
                    buttonText: "SIGNUP",
                    borderRadius: 50,
                    fontSize: ScreenUtil.scaleFactor * 30,
                    textColor: const Color(0xfffa3030),
                    buttonHeight: ScreenUtil.safeBlockVertical * 6,
                    onPressed: onSignUp,
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 2,
                  ),
                  Divider(
                    indent: ScreenUtil.safeBlockHorizontal * 4,
                    endIndent: ScreenUtil.safeBlockHorizontal * 4,
                    thickness: ScreenUtil.safeBlockHorizontal,
                    color: const Color(0xff935736),
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 2,
                  ),
                  Text(
                    "IF YOU HAVE ACCOUNT?",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: ScreenUtil.scaleFactor * 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 2,
                  ),
                  CustomElevatedButton(
                    buttonColor: const Color(0xffcbcdc9),
                    buttonText: "LOGIN HERE",
                    borderRadius: 50,
                    fontSize: ScreenUtil.scaleFactor * 30,
                    textColor: const Color(0xfffa3030),
                    buttonHeight: ScreenUtil.safeBlockVertical * 6,
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.safeBlockVertical * 2,
                  ),
                ],
              ),
            ),
            const BottomActions(),
          ],
        ),
      ),
    );
  }

  onSignUp() async {
    if (formKey.currentState!.validate()) {
      var response = await authRepository.signUpWithEmail(user.email!, passwordController.text);
      response.fold((error) {
        setState(() {});
      }, (success) {});
    }
  }
}
