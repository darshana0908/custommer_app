
import 'package:customer_app/Ui/menu/contact_us/contact_us.dart';
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:page_transition/page_transition.dart';

import '../../conditions/conditions.dart';
import '../about/about.dart';
import '../../home/delivery_form/drag_location.dart';
import '../map/map.dart';
import '../../login_and_signup/login.dart';

class customDrawer extends StatefulWidget {
  const customDrawer({super.key});

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  bool tap = false;
  bool lite = false;
  bool en = false;

  List modeData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: Drawer(
        backgroundColor: black.withOpacity(0.9),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/pngwing.com (4).png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      black.withOpacity(0.9),
                      black == black ? BlendMode.darken : BlendMode.colorDodge,
                    ))),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: SingleChildScrollView(
                          child: Column(
                            // Important: Remove any padding from the ListView.

                            children: [
                              Container(
                                color: white,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: black3,
                                            )),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/logo.jpg',
                                      height: h / 8,
                                      width: w,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h / 15,
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DragLocation(),
                                            ));
                                        // Navigator.pop(context);
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.home_outlined,
                                                  color: white),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'Home',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: Login(),
                                              inheritTheme: true,
                                              ctx: context),
                                        );
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.ac_unit_sharp,
                                                    color: white,
                                                  ),
                                                  SizedBox(
                                                    width: w / 15,
                                                  ),
                                                  Text(
                                                    'Theme',
                                                    style: TextStyle(
                                                        fontSize: 12.dp,
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'sinhala'),
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        lite ? 'Lite' : 'Dark',
                                                        style: TextStyle(
                                                            fontSize: 12.dp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'sinhala'),
                                                      ),
                                                      Switch(
                                                        value: lite,
                                                        onChanged:
                                                            (value) async {
                                                          setState(() {
                                                            lite = value;
                                                          });

                                                          // Provider.of<ProviderS>(context, listen: false).selectedPageIndex = 2;

                                                          // print(lite);
                                                          // if (lite) {
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite = black;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite1 = black1;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite2 = black2;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite3 = black3;
                                                          //   Provider.of<ProviderS>(context, listen: false).pblack = white;
                                                          //   Provider.of<ProviderS>(context, listen: false).pnave = white;
                                                          //   Provider.of<ProviderS>(context, listen: false).pbackground = white;
                                                          //   Provider.of<ProviderS>(context, listen: false).pbackground2 = white2;
                                                          //   Provider.of<ProviderS>(context, listen: false).pb2 = white2;
                                                          //   await SqlDb().updateData('update mode set status ="1"');
                                                          // } else {
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite = white;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite1 = white1;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite2 = white2;
                                                          //   Provider.of<ProviderS>(context, listen: false).pwhite3 = white3;
                                                          //   Provider.of<ProviderS>(context, listen: false).pblack = black;
                                                          //   Provider.of<ProviderS>(context, listen: false).pnave = nevColor;
                                                          //   Provider.of<ProviderS>(context, listen: false).pbackground = bacground;
                                                          //   Provider.of<ProviderS>(context, listen: false).pbackground2 = bacground2;
                                                          //   Provider.of<ProviderS>(context, listen: false).pb2 = b2;
                                                          //   await SqlDb().updateData('update mode set status ="0"');
                                                          // }
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => condition(),
                                            ));
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.language,
                                                    color: white,
                                                  ),
                                                  SizedBox(
                                                    width: w / 15,
                                                  ),
                                                  Text(
                                                    'Language',
                                                    style: TextStyle(
                                                        fontSize: 12.dp,
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'sinhala'),
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        en
                                                            ? 'සිංහල'
                                                            : 'English',
                                                        style: TextStyle(
                                                            fontSize: 12.dp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'sinhala'),
                                                      ),
                                                      Switch(
                                                        value: en,
                                                        onChanged:
                                                            (value) async {
                                                          setState(() {});
                                                        },
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      focusColor: white,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LocationScreen()),
                                        );
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.pin_drop_outlined,
                                                color: white,
                                              ),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'Location',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      focusColor: white,
                                      onTap: () async {
                                        await FlutterShare.share(
                                            title: 'Example share',
                                            text: 'Example share text',
                                            linkUrl: 'https://flutter.dev/',
                                            chooserTitle:
                                                'Example Chooser Title');
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.share_outlined,
                                                color: white,
                                              ),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'Share',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => ContactUs()),
                                        // );
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: white,
                                              ),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'Review',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => About(),
                                            ));
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons
                                                    .check_circle_outline_outlined,
                                                color: white,
                                              ),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'About',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContactUs()));
                                      },
                                      child: Card(
                                        color: white.withOpacity(0.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.add_call,
                                                color: white,
                                              ),
                                              SizedBox(
                                                width: w / 15,
                                              ),
                                              Text(
                                                'Contact Us',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sinhala'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 10,
                                    ),
                                    Column(
                                      children: [
                                        Text("Privarcy Policy",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: white,
                                              fontFamily: "Merienda",
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        SizedBox(
                                          height: h / 40,
                                        ),
                                        Text(
                                            "Copyright 2023 by\nNovatechzone (pvt)Ltd",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: white,
                                              fontFamily: "Merienda",
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.normal,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
