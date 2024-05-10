import 'package:customer_app/Ui/login_and_signup/login.dart';
import 'package:customer_app/Ui/onboard/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/color.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        )));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: white,
      body: SizedBox(
        width: w,
        height: h + 500,
        child: Column(children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/logo.jpg',
              height: h / 5,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Spacer(),
          Text(
            'Powered By Koombiyo IT',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: black1),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
