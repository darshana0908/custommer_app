import 'dart:convert';

import 'package:customer_app/Ui/home/cart/cart_details/cart_details.dart';
import 'package:customer_app/widget/diloag_button.dart';
import 'package:dio/dio.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:developer' as developer;
import '../../../class/class.dart';
import '../../../const/color.dart';
import '../../menu/custom_drawer/custom_drawer.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController _scrollController = ScrollController();
  List cart = [
    {'img': 'assets/a.PNG', 'p': 456},
    {'img': 'assets/a2.PNG', 'p': 156},
    {'img': 'assets/a3.PNG', 'p': 200},
    {'img': 'assets/a4.PNG', 'p': 156},
    {'img': 'assets/a6.PNG', 'p': 56},
  ];
  bool isLoading = false;
  int item = 1;
  int selectedIndex = 0;
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        key: _key,
        backgroundColor: backgroundColor2,
        extendBody: true,
        drawer: customDrawer(),
        appBar: FadableAppBar(
          title: Text(
            'My Cart (4)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          foregroundColorOnFaded: black,
          foregroundColor: white,
          backgroundColor: appliteBlue,
          scrollController: _scrollController,
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isDelete = !isDelete;
                  });
                },
                child: Text(isDelete == false ? 'Delete' : 'Complete'))
          ],
        ),
        body: Stack(
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(children: [
                  SizedBox(
                    height: h,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 250),
                        // shrinkWrap: true,
                        itemCount: cart.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  Navigation().Nav(
                                      context,
                                      CartDetails(
                                        img: cart[index]['img'],
                                      ));
                                },
                                child: Card(
                                  elevation: 10,
                                  color: backgroundColor2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 8, bottom: 8),
                                    child: Slidable(
                                      startActionPane: ActionPane(
                                          motion: ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 2,
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Color(0xFF21B7CA),
                                              foregroundColor: Colors.white,
                                              icon: Icons.favorite,
                                              label: 'Favorites',
                                            ),
                                          ]),
                                      endActionPane: ActionPane(
                                          motion: BehindMotion(),
                                          children: [
                                            SlidableAction(
                                              autoClose: true,
                                              onPressed: (context) {},
                                              backgroundColor:
                                                  Color(0xFFFE4A49),
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                            ),
                                          ]),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Color.fromARGB(
                                                255, 61, 113, 177),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SizedBox(
                                                width: w / 5,
                                                height: h / 9,
                                                child: Image.asset(
                                                  cart[index]['img'],
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Luxury Brand Dog Wommend ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: black2),
                                              ),
                                              Text(
                                                'No Brand Color : Blue',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: black2),
                                              ),
                                              Text(
                                                'only 1 item(s)in stock',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: black2),
                                              ),
                                              SizedBox(
                                                width: w / 1.65,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Rs ${cart[index]['p'].toString()}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: red),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Rs 995',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: red,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            ),
                                                            Text(
                                                              '-70%',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: black3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    index / 2 == 1 ||
                                                            index / 2 == 2 ||
                                                            index / 2 == 4
                                                        ? Text(
                                                            'Qty:1',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: black1),
                                                          )
                                                        : Row(
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      selectedIndex =
                                                                          index;
                                                                      if (selectedIndex ==
                                                                          index) {
                                                                        item =
                                                                            item -
                                                                                1;
                                                                        print(
                                                                            item);
                                                                      }
                                                                    });
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 18,
                                                                    ),
                                                                  )),
                                                              Container(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    31,
                                                                    154,
                                                                    151,
                                                                    151),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            16,
                                                                        vertical:
                                                                            3),
                                                                child: Text(
                                                                  selectedIndex ==
                                                                          index
                                                                      ? item
                                                                          .toString()
                                                                      : '1',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          black3),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      selectedIndex =
                                                                          index;
                                                                      if (selectedIndex ==
                                                                          index) {
                                                                        item +=
                                                                            1;
                                                                      }

                                                                      print(
                                                                          item);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 18,
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ]),
              ),
            ),
            isLoading ? Loader().loader(context) : SizedBox()
          ],
        ),
        bottomSheet: bottoSheet(),
      ),
    );
  }

  Widget bottoSheet() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return AbsorbPointer(
      absorbing: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: appBlue,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: black2),
                        ),
                      ],
                    ),
                    isDelete == false
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Delivery:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: black3),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Rs 123',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: black2,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Rs.239',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: appBlue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: black1),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Rs.3,245',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: red),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox(),
                    DialogButton(
                        text: isDelete ? 'Delete' : 'Check Out(2)',
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          // data();
                          var ddd = await CustomApi().data1();
                          List data = jsonDecode(ddd);
                          print(data[2]);
                          setState(() {
                            isLoading = false;
                          });
                        },
                        buttonHeight: h / 14,
                        width: w / 3,
                        color: appButtonColorLite)
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  data1() async {
    var headers = {
      'Cookie': 'ci_session=636e852939315cffaa1910d77b1183e03764b7e0'
    };
    var data = FormData.fromMap({'search': '56'});

    var dio = Dio();
    var response = await dio.request(
      'https://koombiyodelivery.net/hr2/employeeListForDropdown',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    // if (response.statusCode == 200) {
    //   // print(json.encode(response.data));
    // } else {}

    return json.encode(response.data);
  }

  data() async {
    var request =
        http.Request('GET', Uri.parse('https://gorest.co.in/public/v2/users'));
    var response = await request.send();
    // var res = jsonDecode(request.body.toString());
    print(response.stream.bytesToString());

    // if (response.statusCode == 200) {
    //   // print(await response.stream.bytesToString());
    // } else {
    //   // print(response.reasonPhrase);
    // }
  }
}

class A {
  methodA() {
    print("Method from A");
  }
}

class B {
  void methodB() {
    print("Method from B");
  }
}

class C extends A {
  methodC() {
    print("Method from C");
  }
}

// Subclass Circle that extends Shape

class CustomApi {
  data1() async {
    var headers = {
      'Cookie': 'ci_session=636e852939315cffaa1910d77b1183e03764b7e0'
    };
    var data = FormData.fromMap({'search': '56'});

    var dio = Dio();
    var response = await dio.request(
      'https://koombiyodelivery.net/hr2/employeeListForDropdown',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      // print(json.encode(response.data));
    } else {}

    return json.encode(response.data);
  }
}
