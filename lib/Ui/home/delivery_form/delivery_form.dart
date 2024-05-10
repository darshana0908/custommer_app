import 'dart:ui';
import 'package:customer_app/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../widget/diloag_button.dart';
import '../../../widget/textField.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({super.key});

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  List<String> listitems = [
    "Tokyo",
    "London",
    "New York",
    "Moscow",
    "Hong Kong"
  ];

  List sentPackage = ['Pay By Sender', 'Pay By Receiver'];
  String? accountType;
  String? selectCity;
  String? selectDistrict;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        backgroundColor: appliteBlue,
        title: Text(
          'Koombiyo Express',
          style: TextStyle(
              color: white1, fontSize: 17.dp, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: backgroundColor2,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/12.PNG'), fit: BoxFit.cover),
        // ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            width: w,
            height: h,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please fill the following details for register with KOOMBIYO DELIVERY.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: black2,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Container(
                //     width: w,
                //     decoration: BoxDecoration(
                //         color: white1,
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(
                //             width: 0.7, color: Color.fromARGB(31, 24, 22, 22))),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 12, vertical: 8),
                //           child: Text(
                //             'From',
                //             style: TextStyle(
                //                 color: black2,
                //                 fontSize: 18.dp,
                //                 fontWeight: FontWeight.w500),
                //           ),
                //         ),
                //         Divider(),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: customDropDown('Account Type', true, context,
                //               Icons.menu_sharp, sentPackage, 1),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: CustomTextField(
                //             controller: TextEditingController(),
                //             icon: Icons.person,
                //             text: 'Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: CustomTextField(
                //             controller: TextEditingController(),
                //             icon: Icons.call,
                //             text: 'Phone',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: TextField(
                //             // maxLines: 5,
                //             // minLines: 2,

                //             decoration: InputDecoration(
                //                 contentPadding:
                //                     EdgeInsets.only(bottom: 50, top: 0),
                //                 enabledBorder: OutlineInputBorder(
                //                   borderSide: BorderSide(width: 0.2),
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 focusedBorder: OutlineInputBorder(
                //                   borderSide: BorderSide(width: 0.2),
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 filled: true,
                //                 fillColor: white,
                //                 prefixIcon: Icon(Icons.home),
                //                 hintText: 'Address'),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Card(
                  color: backgroundColor2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 50),
                      child: Container(
                        width: w,
                        decoration: BoxDecoration(
                            // color: white1,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Text(
                                'To',
                                style: TextStyle(
                                    color: black2,
                                    fontSize: 18.dp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                controller: TextEditingController(),
                                icon: Icons.person,
                                text: 'Name',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                controller: TextEditingController(),
                                icon: Icons.call,
                                text: 'Phone',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                controller: TextEditingController(),
                                icon: Icons.home,
                                text: 'Address',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customDropDown('select District', true,
                                  context, Icons.pin_drop, listitems, 2),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customDropDown(
                                  'select City',
                                  true,
                                  context,
                                  Icons.location_city_rounded,
                                  listitems,
                                  3),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                DialogButton(
                  buttonHeight: h / 15,
                  width: w / 1.3,
                  text: 'Save',
                  color: appButtonColorLite,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //       type: PageTransitionType.bottomToTop,
                    //       duration: Duration(milliseconds: 800),
                    //       child: DeliveryForm(),
                    //       inheritTheme: true,
                    //       ctx: context),
                    // );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customDropDown(String text, bool isMobile, BuildContext context,
      IconData icon, List myList, int x) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 237, 237),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Color.fromARGB(255, 228, 226, 226), width: 0.6)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: white,
        ),
        child: DropdownButton(
          style: TextStyle(backgroundColor: Colors.transparent),
          dropdownColor: white,
          borderRadius: BorderRadius.circular(10),
          focusColor: Color.fromARGB(255, 228, 226, 226),
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: black,
          ),
          isExpanded: true,
          iconEnabledColor: bacground,
          autofocus: true,
          underline: SizedBox(),

          padding: EdgeInsets.only(right: 20),
          alignment: AlignmentDirectional.centerEnd,
          hint: Container(
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                SizedBox(
                  width: 12,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: black1,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          value: x == 1
              ? accountType
              : x == 2
                  ? selectDistrict
                  : selectCity,

          //implement initial value or selected value
          onChanged: (value) {
            setState(() {
              if (x == 1) {
                accountType = value.toString();
              } else if (x == 2) {
                selectDistrict = value.toString();
              } else {
                selectCity = value.toString();
              }
            });
          },
          items: myList.map((itemone) {
            return DropdownMenuItem(
                value: itemone,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(icon),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: Text(
                            itemone.toString(),
                            style: TextStyle(
                                color: black1, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
