import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:timelines/timelines.dart';
import '../../../../const/color.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 213, 213),
      appBar: FadableAppBar(
        title: Text('Delivery Details'),
        centerTitle: true,
        foregroundColorOnFaded: black,
        foregroundColor: white,
        backgroundColor: appliteBlue,
        scrollController: _scrollController,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
                    width: w,
                    decoration: BoxDecoration(
                        color: appButtonColorLite,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivered',
                          style: TextStyle(
                              color: white,
                              fontSize: 18.dp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Package was delivered on',
                          style: TextStyle(
                              color: white,
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Fri 17 Feb',
                          style: TextStyle(
                              color: white,
                              fontSize: 32.dp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      'Courier LK_GAM_HUB - Kudaliagamage Yoha',
                      style: TextStyle(
                          color: black,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      'Delivery Partner: LK-DEX',
                      style: TextStyle(
                          color: black3,
                          fontSize: 12.dp,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Tracking Number',
                    style: TextStyle(
                        color: black3,
                        fontSize: 12.dp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Lk -Kr 123141513',
                    style: TextStyle(
                        color: appBlue,
                        fontSize: 12.dp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Receiver : Darshana Devinda Arachchi',
                      style: TextStyle(
                          color: black1,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '0716232004',
                      style: TextStyle(
                          color: black2,
                          fontSize: 12.dp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Receiver Receiver ReceiverReceiverReceiver Receiver Receiver ',
                      style: TextStyle(
                          color: black2,
                          fontSize: 12.dp,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                  alignment: Alignment.centerLeft,
                  width: w,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FixedTimeline.tileBuilder(
                        theme: TimelineThemeData(
                          nodePosition: 0.2,
                          color: Color.fromARGB(255, 247, 247, 247),
                          indicatorTheme: IndicatorThemeData(
                            position: 0.15,
                            size: 25.0,
                          ),
                          connectorTheme: ConnectorThemeData(
                            thickness: 2.5,
                          ),
                        ),
                        builder: TimelineTileBuilder.connected(
                          addAutomaticKeepAlives: true,
                          contentsAlign: ContentsAlign.reverse,
                          oppositeContentsBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivered${index.toString()}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: index == 0 ? appBlue : black3,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'TimelineTileBuilder provides powerful build features.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45),
                                ),
                              ],
                            ),
                          ),
                          contentsBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '23 Feb 2023',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                            );
                          },
                          connectorBuilder: (_, index, ___) =>
                              SolidLineConnector(
                            thickness: 1,
                            color:
                                index == 0 ? Color(0xff66c97f) : Colors.black12,
                          ),
                          indicatorBuilder: (_, index) {
                            return DotIndicator(
                                color: index == 0
                                    ? Color.fromARGB(255, 50, 92, 227)
                                    : Colors.black12,
                                child: index == 0
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 12.0,
                                      )
                                    : SizedBox());
                          },
                          itemCount: 7,
                        ),
                      ))),
            ),
          ]),
        ),
      ),
    );
  }
}
