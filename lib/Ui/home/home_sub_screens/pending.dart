import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../const/color.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  List<Map<String, dynamic>> depositList = [
    {'date': '2023/01/23'},
    {'date': '2023/11/23'},
    {'date': '2023/02/23'},
    {'date': '2023/01/21'},
    {'date': '2023/01/23'},
    {'date': '2023/01/24'}
  ];
  List<Map<String, dynamic>> depositListTemp = [];
  @override
  void initState() {
    setState(() {
      depositListTemp = depositList;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarBlue,
        bottom: PreferredSize(
            preferredSize: Size(w, 80),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: serchBarr(context),
            )),
        title: Text(
          'Pending',
          style: TextStyle(
            fontSize: 18.dp,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: white,
            )),
      ),
      backgroundColor: Color.fromARGB(255, 240, 252, 249),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: depositList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Card(
                margin: EdgeInsets.all(0),
                elevation: 20,
                color: Color.fromARGB(255, 229, 247, 252),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w / 2.4,
                            child: Row(
                              children: [
                                Icon(Icons.add_card_rounded),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "COD Amount",
                                  style: TextStyle(
                                    fontSize: 17.dp,
                                    color: black1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "- 2000",
                            style: TextStyle(
                              fontSize: 12.dp,
                              color: black1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 2.4,
                            child: Text(
                              "Deposit Amount",
                              style: TextStyle(
                                fontSize: 12.dp,
                                color: black1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "- 450",
                            style: TextStyle(
                              fontSize: 12.dp,
                              color: black1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: w / 2.4,
                            child: Text(
                              "Variance",
                              style: TextStyle(
                                fontSize: 12.dp,
                                color: black1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "- 12333",
                            style: TextStyle(
                              fontSize: 12.dp,
                              color: black1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          depositList[index]['date'],
                          style: TextStyle(
                            fontSize: 12.dp,
                            color: black3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = depositListTemp;
    } else if (depositListTemp
        .where((user) =>
            user["date"].toLowerCase().contains(enteredKeyword.toLowerCase()))
        .toList()
        .isNotEmpty) {
      results = depositListTemp
          .where((user) =>
              user["date"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      depositList = results;
      print(depositList);
    });
  }

  Widget serchBarr(BuildContext con) {
    var h = MediaQuery.of(con).size.height;
    var w = MediaQuery.of(con).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: h / 15,
        child: Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 50,
                child: TextFormField(
                  controller: search,
                  onChanged: (value) {
                    _runFilter(value);
                  },
                  // controller: search,
                  style: TextStyle(color: black, fontSize: 13.sp),
                  validator: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.qr_code_scanner_sharp)),
                    suffixIcon: search.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: white2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: white3
                          // color: pink.withOpacity(0.1),
                          ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(fontSize: 13.dp),
                    hintText: 'Scan or search',
                    fillColor: white2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
