import 'dart:ui';

import 'package:customer_app/Ui/conditions/conditions.dart';
import 'package:customer_app/Ui/login_and_signup/sign_up.dart';
import 'package:customer_app/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../../const/color.dart';
import '../../widget/diloag_button.dart';
import '../../widget/gmail_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {

    super.initState();
  }

  bool isVisible = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor2,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          child: Stack(
            children: [
              SlideAnimation(
                verticalOffset: -400,
                duration: Duration(milliseconds: 1400),
                child: CircleAvatar(radius: 200, backgroundColor: Colors.grey),
              ),
              SlideAnimation(
                horizontalOffset: -400,
                duration: Duration(milliseconds: 1400),
                child: CircleAvatar(
                    radius: 550,
                    backgroundColor: Color.fromARGB(255, 123, 191, 255)),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: SlideAnimation(
                      horizontalOffset: -400,
                      duration: Duration(milliseconds: 1400),
                      child: CircleAvatar(
                          radius: 550, backgroundColor: appButtonColorLite),
                    ),
                  )),
              Container(
                height: h,
                width: w,
                color: black.withOpacity(0.7),
              ),
              ClipRRect(
                child: SingleChildScrollView(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        color: white.withOpacity(0.1),
                        width: w,
                        height: h,
                        child: Column(
                          children: [
                            Spacer(),
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 32.dp,
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter'),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Please login to continue using our app',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.dp,
                                  color: white2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'),
                            ),
                            SizedBox(
                                height: h / 3,
                                child:
                                    Lottie.asset('assets/login_screen.json')),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: w / 1.2,
                              height: h / 17,
                              child: CustomTextField(
                                  icon: Icons.person,
                                  controller: userName,
                                  text: 'user name'),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: w / 1.2,
                              height: h / 17,
                              child: CustomTextField(
                                  icon: Icons.lock_clock_outlined,
                                  controller: userName,
                                  text: 'password'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DialogButton(
                              buttonHeight: h / 17,
                              color: appButtonColorLite,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => condition(),
                                    ));
                              },
                              text: 'LOGIN',
                              width: w / 1.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'or connect with',
                                      style: TextStyle(
                                          fontSize: 12.dp,
                                          color: white2,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                  Flexible(child: Divider()),
                                ],
                              ),
                            ),
                            GmailButton(
                              buttonHeight: h / 17,
                              color: const Color.fromARGB(255, 46, 33, 28),
                              onTap: () {},
                              text: '',
                              width: w / 1.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account",
                                  style: TextStyle(
                                      fontSize: 12.dp,
                                      color: white3,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Inter'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                        ));
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 12.dp,
                                        color: white1,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Inter'),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
