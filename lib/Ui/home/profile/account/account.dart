import 'dart:io';

import 'package:customer_app/Ui/conditions/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import '../../../../class/class.dart';
import '../../../../const/color.dart';
import '../../../../widget/appBar.dart';
import '../my_orders/my_oders.dart';
import '../profile.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // AdmobBannerSize? bannerSize;
  // @override
  // void initState() {
  //   bannerSize = AdmobBannerSize.BANNER;
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor2,
      key: _key,
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      appBar: CustomAppBar().bar(_scrollController, black, white, () {
        _key.currentState!.openDrawer();
      }, () {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: Profile(),
              inheritTheme: true,
              ctx: context),
        );
      }, Icons.person, true, _key),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: w,
              height: h / 6,
              child: Image.asset(
                'assets/5180205.jpg',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: backgroundColor2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My orders',
                          style: TextStyle(
                              color: black2,
                              fontSize: 17.dp,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All >',
                            style: TextStyle(
                                color: appBlue,
                                fontSize: 14.dp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigation().Nav(
                                context,
                                MyOder(
                                  tapPosition: 0,
                                ));
                          },
                          child: Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: SizedBox(
                                width: w / 3.6,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.payment_outlined,
                                      size: 30,
                                      color: black3,
                                    ),
                                    Text(
                                      'To Pay',
                                      style: TextStyle(
                                          color: black3,
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigation().Nav(
                                context,
                                MyOder(
                                  tapPosition: 1,
                                ));
                          },
                          child: Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: SizedBox(
                                width: w / 3.8,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.badge_outlined,
                                      size: 30,
                                      color: black3,
                                    ),
                                    Text(
                                      'To Ship',
                                      style: TextStyle(
                                          color: black3,
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigation().Nav(
                                context,
                                MyOder(
                                  tapPosition: 2,
                                ));
                          },
                          child: Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: SizedBox(
                                width: w / 3.6,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.local_shipping_outlined,
                                      size: 30,
                                      color: black3,
                                    ),
                                    Text(
                                      'To Receive',
                                      style: TextStyle(
                                          color: black3,
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Card(
                        //   color: backgroundColor2,
                        //   elevation: 20,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Column(
                        //       children: [
                        //         Icon(
                        //           Icons.reviews_outlined,
                        //           size: 30,
                        //           color: black3,
                        //         ),
                        //         Text(
                        //           'To Review',
                        //           style: TextStyle(
                        //               color: black3,
                        //               fontSize: 12.dp,
                        //               fontWeight: FontWeight.normal),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Api().sendFcm(
                                'Notification',
                                'We send Notification Hello !',
                                'c6umJUtjSZGerEnzoXx6-l:APA91bERd6uXvfhdnEWel4s9P17JMeG0xJ0mERpgaMwXPV6jWSGipA-uYVo3EqFERHS7gEBuT68ywsF65iA4RRv9ngI-YosibH_Gb3Fj02chfLMwY9CN--pCERv1i4a9dpVY32vpSPlC');
                          },
                          child: Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 30,
                                    color: black3,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'My Return',
                                    style: TextStyle(
                                        color: black3,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Api().sendFcm(
                                'Notification',
                                'We send Notification Hello !',
                                'dJlSs1SrTW2EU7xOvu7WnA:APA91bH4Zu3Wb_lZDT6jRBmRWUPm7kbPN20QysN-fYV3IMXSCFlQIbnsMlbba8oViiOge0yN6Oq0qcdVyOtYgouMtBhvluW4suz87GBs4Zhx4MPIism9oSwL0LgCnQejH2TCuFke-9ka');
                          },
                          child: Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.event_note_outlined,
                                    size: 30,
                                    color: black3,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'My Cancellations',
                                    style: TextStyle(
                                        color: black3,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.all(8),
          //   child: AdmobBanner(
          //     adUnitId: getBannerAdUnitId()!,
          //     adSize: AdmobBannerSize.LARGE_BANNER,
          //     listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
          //       // handleEvent(event, args, 'Banner');
          //     },
          //     onBannerCreated: (AdmobBannerController controller) {},
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: backgroundColor2,
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Services',
                      style: TextStyle(
                          color: black2,
                          fontSize: 17.dp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 30,
                                    color: black3,
                                  ),
                                  Text(
                                    'My Messages',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: black3,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.help_outline,
                                    size: 30,
                                    color: black3,
                                  ),
                                  Text(
                                    'Help Center',
                                    style: TextStyle(
                                        color: black3,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: backgroundColor2,
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.change_circle_outlined,
                                    size: 30,
                                    color: black3,
                                  ),
                                  Text(
                                    'Chat with us',
                                    style: TextStyle(
                                        color: black3,
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Card(
                          color: backgroundColor2,
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.post_add_sharp,
                                  size: 30,
                                  color: black3,
                                ),
                                Text(
                                  'Payment Options',
                                  style: TextStyle(
                                      color: black3,
                                      fontSize: 12.dp,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: backgroundColor2,
                          elevation: 20,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.rate_review_outlined,
                                  size: 30,
                                  color: black3,
                                ),
                                Text(
                                  'My Reviews',
                                  style: TextStyle(
                                      color: black3,
                                      fontSize: 12.dp,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
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

class Api {
  final HttpClient httpClient = HttpClient();
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  final fcmKey =
      "AAAAXcwCn7Y:APA91bG4QhBaOrJZiCjV_bVnAXRd2NP4xhSrkuRS-11QKAg_xuY6RKxCXik8X_aSNT0Y59mEGjUh2fb47xm9KVpZckCJFDAM5_474nH4awgm2gkmVGh9pROd7aLI3immJ7vWqOjOng01";

  void sendFcm(String title, String body, String fcmToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$fcmKey'
    };
    var request = http.Request('POST', Uri.parse(fcmUrl));
    request.body =
        '''{"to":"$fcmToken","priority":"high","notification":{"title":"$title","body":"$body","sound": "default","image": "https://googleflutter.com/wp-content/uploads/2019/12/flutter_image_network.png"
}}''';
    request.headers.addAll(headers);
    print(request.body);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
