import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../class/class.dart';
import '../../../../const/color.dart';
import '../delivery_details/delivery_details.dart';

class MyOder extends StatefulWidget {
  const MyOder({super.key, required this.tapPosition});
  final int tapPosition;

  @override
  State<MyOder> createState() => _MyOderState();
}

class _MyOderState extends State<MyOder> with SingleTickerProviderStateMixin {
  // TabController _controller =TabController(length: 4, vsync: vsync);
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    load();
  }

  load() {
    _tabController!.animateTo((_tabController!.index + widget.tapPosition));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  final List<Widget> myTabs = [
    Text(
      'All',
      style: TextStyle(
          fontSize: 15.dp, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
    ),
    Text(
      'To Ship',
      style: TextStyle(
          fontSize: 15.dp, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
    ),
    Text(
      'To Receive',
      style: TextStyle(
          fontSize: 15.dp, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          bottom: TabBar(
              controller: _tabController,
              labelStyle: TextStyle(color: appButtonColorLite),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: appButtonColorLite,
              isScrollable: true,
              tabs: myTabs),
          title: Text(
            'My Orders',
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            allOders('Delivered', 'Placed on',
                Color.fromARGB(255, 67, 191, 131), false),
            allOders('Processing', 'Get by ', appButtonColorLite, false),
            allOders('Processing', 'Get by ', appButtonColorLite, true),
          ],
        ),
      ),
    );
  }

  Widget allOders(String status, String time, Color color, bool toReceive) {
    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Card(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Show :',
                    style: TextStyle(
                        fontSize: 14.dp,
                        fontWeight: FontWeight.bold,
                        color: black1),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  // SizedBox(
                  //     width: w / 2,
                  //     height: h / 16,
                  //     child: customDropDown('ddd', true)),
                ],
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 120),
                  itemCount: 20,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Order ',
                                      style: TextStyle(
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.bold,
                                          color: black2),
                                    ),
                                    Text(
                                      '#210086691242855',
                                      style: TextStyle(
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 3, 164, 118)),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigation()
                                        .Nav(context, DeliveryDetails());
                                  },
                                  child: Text(
                                    'MANAGE',
                                    style: TextStyle(
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 2, 38, 166)),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$time 14 Feb 2023 12:07:10',
                              style: TextStyle(
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.normal,
                                  color: black2),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  color: backgroundColor2,
                                  elevation: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/6.PNG',
                                      width: w / 5,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: w / 2,
                                      child: Text(
                                        'P47 Wireless Bluetooth',
                                        style: TextStyle(
                                            fontSize: 12.dp,
                                            fontWeight: FontWeight.normal,
                                            color: black1),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: w / 10,
                                          child: Text(
                                            'Qty: 1',
                                            style: TextStyle(
                                                fontSize: 12.dp,
                                                fontWeight: FontWeight.bold,
                                                color: black1),
                                          ),
                                        ),
                                        time == 'Placed on'
                                            ? Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  'Delivered on 17 Feb 2023',
                                                  style: TextStyle(
                                                      fontSize: 12.dp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black1),
                                                ),
                                              )
                                            : SizedBox(),
                                        toReceive
                                            ? Column(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12,
                                                                vertical: 4),
                                                        child: Text(
                                                          'On the way',
                                                          style: TextStyle(
                                                              fontSize: 12.dp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: black2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons
                                                          .warehouse_outlined),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 3,
                                                        width: w / 7,
                                                        color: Color.fromARGB(
                                                            255, 3, 94, 38),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Icon(
                                                          Icons.local_shipping,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: w / 7,
                                                        child: DottedLine(
                                                          direction:
                                                              Axis.horizontal,
                                                          alignment:
                                                              WrapAlignment
                                                                  .center,
                                                          lineLength:
                                                              double.infinity,
                                                          lineThickness: 1.0,
                                                          dashLength: 15.0,
                                                          dashColor:
                                                              Colors.black,
                                                          dashRadius: 0.0,
                                                          dashGapLength: 4.0,
                                                          dashGapColor: Colors
                                                              .transparent,
                                                          dashGapRadius: 0.0,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.pin_drop,
                                                        color: Colors.red,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Card(
                                                  elevation: 20,
                                                  color: color,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 4),
                                                    child: Text(
                                                      status,
                                                      style: TextStyle(
                                                          fontSize: 12.dp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
