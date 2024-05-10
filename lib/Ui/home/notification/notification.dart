import 'package:customer_app/Ui/conditions/custom_drawer/custom_drawer.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../const/color.dart';
import '../../menu/custom_drawer/custom_drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _key,
        extendBodyBehindAppBar: true,
        extendBody: true,
        drawer: MyDrawer(),
        appBar: FadableAppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              statusBarColor: statusBarColor),
          title: Text('Notification'),
          centerTitle: true,
          titleSpacing: 0,
          leading: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: Image.asset('assets/icon-02.png')),
          foregroundColorOnFaded: black,
          foregroundColor: white,
          backgroundColor: appBarBlue,
          scrollController: _scrollController,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: backgroundColor2,
        body: Scrollbar(
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: backgroundColor2,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Koombiyo Delivery ',
                          style: TextStyle(
                            fontSize: 18.dp,
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Koombiyo Delivery ,Koombiyo Delivery  Koombiyo Delivery  Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery ',
                        style: TextStyle(
                          fontSize: 12.dp,
                          color: black1,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '2024/02/22',
                          style: TextStyle(
                            fontSize: 12.dp,
                            color: black2,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
