import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_app/Ui/conditions/custom_drawer/custom_drawer.dart';
import 'package:customer_app/Ui/home/home_sub_screens/exchange/exchange.dart';
import 'package:customer_app/Ui/home/home_sub_screens/pending.dart';
import 'package:customer_app/Ui/home/profile/delivery_details/delivery_details.dart';
import 'package:customer_app/Ui/home/voiceCall/voice_call.dart';
import 'package:customer_app/class/class.dart';
import 'package:customer_app/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../../const/app_details.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  Color cBlue = Color.fromARGB(255, 1, 41, 101);
  // AdmobBannerSize? bannerSize;
  ScrollController _scrollController = ScrollController();
  final CarouselController _controller = CarouselController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  DateTime now = DateTime.now();
  String greeting = "";
  int hours = 0;
  int _current = 0;
  List miImg = [
    'assets/WhatsApp Image 2024-02-21 at 10.05.10_5aa960ac.jpg',
    'assets/WhatsApp Image 2024-02-21 at 10.04.13_f026007a.jpg',
    'assets/WhatsApp Image 2024-02-21 at 10.04.25_2935b5aa.jpg'
  ];
  @override
  void initState() {
    hours = now.hour;

    if (hours >= 1 && hours <= 12) {
      greeting = "Good Morning";
    } else if (hours >= 12 && hours <= 16) {
      greeting = "Good Afternoon";
    } else if (hours >= 16 && hours <= 21) {
      greeting = "Good Evening";
    } else if (hours >= 21 && hours <= 24) {
      greeting = "Good Night";
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: MyDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Image.asset('assets/icon-02.png')),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: statusBarColor),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello, $greeting ! \nDarshana ',
                  style: TextStyle(
                      color: white,
                      fontSize: 17.dp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Macondo'),
                ),
                Icon(
                  Icons.account_circle_rounded,
                  color: white3,
                  size: 50,
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 240, 177, 20),
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 240, 177, 20),
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 240, 177, 20),
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 240, 177, 20),
                  size: 22,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 240, 177, 20),
                  size: 22,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ]),
          // height: h / 4,
          width: w,
          decoration: BoxDecoration(
              // gradient: LinearGradient(colors: [
              //   Color.fromARGB(255, 110, 130, 217),
              //   Color.fromARGB(255, 2, 107, 172)
              // ]),
              // Color.fromARGB(255, 10, 86, 167)
              color: appBarBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        SingleChildScrollView(
          // controller: _scrollController,
          child: Column(
            children: [
              SizedBox(
                height: h / 6 + 50,
              ),
              Container(
                // height: h,
                width: w,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [homeCard()],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget homeCard() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     'Oder details',
        //     style: TextStyle(
        //       color: black,
        //       fontSize: 17.dp,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      oderCard2('assets/Logo-06-09.png', 'Pending', '0',
                          Color.fromARGB(255, 141, 18, 18), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pending(),
                            ));
                      }),
                      oderCard2('assets/Logo-03.png', 'Delivered', '10',
                          Color.fromARGB(255, 47, 151, 47), () {
                        ZegoUIKitPrebuiltCallInvitationService()
                            .send(
                                notificationMessage:
                                    'helo koombiyo app calling you',
                                notificationTitle: 'sssssssssssssssssssssss',
                                customData: 'xxxxxxxxxxxxxxxxxx',
                                invitees: [ZegoCallUser('1', '1')],
                                isVideoCall: false)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VoiceCall(),
                                )));
                      }),
                      oderCard2('assets/Logo-06-05.png', 'Reschedule',
                          '1000000', Color.fromARGB(255, 107, 72, 72), () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      oderCard2('assets/Logo-06-06.png', 'Cancelled', '0',
                          Color.fromARGB(255, 165, 151, 3), () {}),
                      oderCard2('assets/Logo-04.png', 'Total', '10',
                          Color.fromARGB(255, 177, 73, 18), () {}),
                      oderCard2('assets/Logo-06-08.png', 'Exchange', '100',
                          Color.fromARGB(255, 64, 3, 111), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExchangeScreens(),
                            ));
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Track your Package',
            style: TextStyle(
              color: black,
              fontSize: 17.dp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        serchBar(context),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     'Up Coming News',
        //     style: TextStyle(
        //       color: black1,
        //       fontSize: 17.dp,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: SizedBox(
              height: h / 4,
              width: w,
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: w / 1.1,
                            child: Image.asset(miImg[index],
                                height: h / 3, fit: BoxFit.cover, width: w),
                          ),
                        ),
                      ),
                      Container(
                        width: w,
                        height: h / 3,
                        // color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  );
                },
                itemCount: miImg.length,
                // carouselController: _controller,
                options: CarouselOptions(
                    animateToClosest: true,
                    padEnds: false,
                    // aspectRatio: 1.0,
                    autoPlay: true,
                    // disableCenter: true,
                    viewportFraction: 0.9,
                    enlargeFactor: 0.2,
                    // enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: miImg.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? black
                            : Color.fromARGB(255, 22, 22, 23))
                        .withOpacity(_current == entry.key ? 1 : 0.4)),
              ),
            );
          }).toList(),
        ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.all(8),
        //   child: AdmobBanner(
        //     adUnitId: getBannerAdUnitId()!,
        //     adSize: AdmobBannerSize.BANNER,
        //     listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        //       // handleEvent(event, args, 'Banner');
        //     },
        //     onBannerCreated: (AdmobBannerController controller) {},
        //   ),
        // ),
      ],
    );
  }

  Widget oderCard2(String image, String title, String value, Color color,
      VoidCallback onTap) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: badges.Badge(
        position: badges.BadgePosition.custom(start: 10, top: -10),
        badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            badgeColor: Color.fromARGB(255, 75, 179, 239),
            borderRadius: BorderRadius.circular(7)),
        badgeContent: Text(
          value,
          style: TextStyle(color: white, fontSize: 10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Color.fromARGB(255, 244, 242, 242),
                elevation: 0,
                child: SizedBox(
                  width: w / 3.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: h / 10, child: Image.asset(image)),
                    ],
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 92, 92),
                    fontSize: 12.dp,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serchBar(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: h / 17,
      // width: w / 1.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {
                  // _runFilter(value);
                },
                onFieldSubmitted: (value) {
                  print('ddddddddd');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryDetails(),
                      ));
                },
                // controller: search,
                style: TextStyle(color: black, fontSize: 13),

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: white)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: white
                        // color: pink.withOpacity(0.1),
                        ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(fontSize: 13.dp),
                  hintText: 'Enter Your Waybill Id',
                  fillColor: Color.fromARGB(255, 244, 242, 242),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }
}
