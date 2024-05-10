
import 'package:customer_app/const/color.dart';
import 'package:customer_app/widget/diloag_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';

class NumberCheckOtp extends StatelessWidget {
  const NumberCheckOtp({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black,
      body: Container(
        width: w,
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Card(
          elevation: 40,
          borderOnForeground: true,
          surfaceTintColor: appBlue,
          // color: appBlue,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'Enter OTP',
                style: TextStyle(
                    fontSize: 27.dp,
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter'),
              ),
              Text(
                " Check your sms box get the verification \ncode of your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.dp,
                    color: black2,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter'),
              ),
              SizedBox(
                  height: h / 4, child: Lottie.asset('assets/enter_otp.json')),
              Flexible(
                child: OtpTextField(
                  numberOfFields: 5,
                  borderColor: black,
                  focusedBorderColor: black,
                  disabledBorderColor: black2,
                  fillColor: black,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: black1))),
                  // styles: style(),
                  showFieldAsBox: false,
                  enabledBorderColor: black3,

                  borderWidth: 2.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here if necessary
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DialogButton(
                  text: 'VERIFY',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonHeight: h / 13,
                  width: w,
                  color: appButtonColorLite),
              SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
