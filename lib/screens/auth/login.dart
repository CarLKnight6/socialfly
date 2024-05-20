import 'package:flutter/material.dart';
import 'package:social_fly/screens/auth/sign_up.dart';
import 'package:social_fly/screens/base.dart';
import 'package:social_fly/screens/dashboard/home.dart';
import 'package:social_fly/utils/screen.dart';
import 'package:social_fly/widgets/bottom_actions.dart';
import 'package:social_fly/widgets/custom/elevated_button.dart';
import 'package:social_fly/widgets/custom/text_form_field.dart';

import '../../repositories/auth.dart';
import '../../repositories/interfaces/auth.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends BasePageState<LoginScreen> with Base {
  IAuthRepository authRepository = AuthRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    hasBottomNavBar(false);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SOCIALFLY EMAIL LOGIN',
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
                        controller: emailController,
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
                        isPassword: true,
                        controller: passwordController,
                        fontSize: ScreenUtil.scaleFactor * 15,
                        borderRadius: 0,
                        horizontalPadding: ScreenUtil.safeBlockHorizontal * 2,
                        label: "INPUT YOUR PASSWORD HERE",
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
                  buttonText: "LOGIN",
                  borderRadius: 50,
                  fontSize: ScreenUtil.scaleFactor * 30,
                  textColor: const Color(0xfffa3030),
                  buttonHeight: ScreenUtil.safeBlockVertical * 6,
                  onPressed: onLogin,
                ),
                SizedBox(
                  height: ScreenUtil.safeBlockVertical * 2,
                ),
                CustomElevatedButton(
                  buttonColor: const Color(0xffcbcdc9),
                  buttonText: "FORGOT PASSWORD",
                  borderRadius: 50,
                  fontSize: ScreenUtil.scaleFactor * 30,
                  textColor: const Color(0xfffa3030),
                  buttonHeight: ScreenUtil.safeBlockVertical * 6,
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
                  "IF YOU DON'T HAVE AND ACCOUNT?",
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
                  buttonText: "SIGNUP HERE",
                  borderRadius: 50,
                  fontSize: ScreenUtil.scaleFactor * 30,
                  textColor: const Color(0xfffa3030),
                  buttonHeight: ScreenUtil.safeBlockVertical * 6,
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const SignUpScreen(),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.safeBlockVertical * 2,
                ),
              ],
            ),
            const BottomActions(),
          ],
        ),
      ),
    );
  }

  onLogin() async {
    var response = await authRepository.signInWithEmail(emailController.text, passwordController.text);
    response.fold((error) {}, (user) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    });
  }
}
