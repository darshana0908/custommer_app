import 'package:customer_app/Ui/menu/about/about.dart';
import 'package:customer_app/Ui/menu/contact_us/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../const/color.dart';
import '../../menu/map/map.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String index = '1';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.2,
      backgroundColor: Color.fromARGB(255, 128, 169, 240),
      child: Stack(children: [
        Positioned(
            top: 100,
            right: 0,
            bottom: 50,
            left: w / 2,
            child: Image.asset(
              'assets/drawr.png',
              fit: BoxFit.cover,
            )),
        Container(
          height: h,
          width: w,
          color: white.withOpacity(0.6),
        ),
        Container(
          height: h,
          width: w,
          color: appBarColor.withOpacity(0.5),
        ),
        Positioned(
            top: 50,
            right: 0,
            bottom: 20,
            left: w / 1.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/drawr.png',
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: h,
          width: w,
          color: appBarColor.withOpacity(0.2),
        ),
        Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/logo.png')),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Darshana Devinda',
                              style: TextStyle(
                                fontSize: 15.dp,
                                color: white1,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              'Customer',
                              style: TextStyle(
                                fontSize: 12.dp,
                                color: white3,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w / 1.8,
                    height: h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: w / 2.2,
                            child: Divider(
                                color:
                                    const Color.fromARGB(255, 134, 151, 180)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomCard(context, '1', index, () {
                          Navigator.pop(context);
                          setState(() {
                            index = '1';
                          });
                        }, Icons.home, 'Home'),
                        CustomCard(context, '2', index, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationScreen()),
                          );
                          setState(() {
                            index = '2';
                          });
                        }, Icons.location_on_outlined, 'Location'),
                        CustomCard(context, '3', index, () async {
                          await FlutterShare.share(
                              title: 'Example share',
                              text: 'Example share text',
                              linkUrl: 'https://flutter.dev/',
                              chooserTitle: 'Example Chooser Title');
                          setState(() {
                            index = '3';
                          });
                        }, Icons.share, 'Share'),
                        CustomCard(context, '4', index, () async {
                          setState(() {
                            index = '4';
                          });
                        }, Icons.star_border, 'Review'),
                        CustomCard(context, '5', index, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => About(),
                              ));
                          setState(() {
                            index = '5';
                          });
                        }, Icons.check_circle_outline, 'About'),
                        CustomCard(context, '6', index, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs()));
                          setState(() {
                            index = '6';
                          });
                        }, Icons.add_call, 'Contact Us'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 47,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                backgroundColor: white.withOpacity(0.1),
                child: Icon(
                  Icons.close,
                  size: 35,
                  color: white2,
                ),
              )),
        ),
      ]),
    );
  }

  Widget CustomCard(BuildContext context, String key, String index,
      VoidCallback onTap, IconData icon, String title) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            key: Key(key),
            alignment: Alignment.centerLeft,
            width: w / 2,
            height: h / 16,
            decoration: BoxDecoration(
                color: white.withOpacity(key == index ? 0.6 : 0),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  icon,
                  color: key == index ? black2 : white2,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.dp,
                    color: key == index ? black2 : white2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            width: w / 2.2,
            height: 20,
            child: key == index
                ? Divider(
                    color: white3,
                  )
                : SizedBox())
      ],
    );
  }
}
