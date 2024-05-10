import 'dart:ui';

import 'package:customer_app/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../const/color.dart';
import '../../widget/diloag_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    // TODO: implemen
    //st initState
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
                child: CircleAvatar(
                    radius: 200,
                    backgroundColor: const Color.fromARGB(255, 15, 67, 109)),
              ),
              SlideAnimation(
                horizontalOffset: -400,
                duration: Duration(milliseconds: 1400),
                child: CircleAvatar(
                    radius: 550,
                    backgroundColor: Color.fromARGB(255, 114, 88, 3)),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: SlideAnimation(
                      horizontalOffset: -400,
                      duration: Duration(milliseconds: 1400),
                      child: CircleAvatar(
                          radius: 550,
                          backgroundColor: Color.fromARGB(255, 12, 126, 119)),
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
                              'Sign Up',
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
                              'Please SignUp to continue using our app',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.dp,
                                  color: white2,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter'),
                            ),
                            Spacer(),
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
                                  icon: Icons.email,
                                  controller: userName,
                                  text: 'email'),
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
                              height: 12,
                            ),
                            SizedBox(
                              width: w / 1.2,
                              height: h / 17,
                              child: CustomTextField(
                                  icon: Icons.lock_reset_rounded,
                                  controller: userName,
                                  text: 'Confirm password'),
                            ),
                            Spacer(),
                            DialogButton(
                              buttonHeight: h / 17,
                              color: appButtonColorLite,
                              onTap: () {},
                              text: 'SignUp',
                              width: w / 1.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an account",
                                  style: TextStyle(
                                      fontSize: 12.dp,
                                      color: white3,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Inter'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Login",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: white2,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
