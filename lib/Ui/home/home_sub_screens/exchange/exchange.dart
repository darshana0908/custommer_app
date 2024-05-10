import 'dart:ui';

import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ExchangeScreens extends StatefulWidget {
  const ExchangeScreens({super.key});

  @override
  State<ExchangeScreens> createState() => _ExchangeScreensState();
}

class _ExchangeScreensState extends State<ExchangeScreens> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  TextEditingController exchangeText = TextEditingController();
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
    var h = MediaQuery.of(context).size.height;
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
          'Exchange Screens',
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
      body: SingleChildScrollView(
        child: Container(
          height: h,
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amish mini mart",
                            style: TextStyle(
                              fontSize: 15.dp,
                              color: black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              "Purchased on  02 Nov 2024 ",
                              style: TextStyle(
                                fontSize: 12.dp,
                                color: black1,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10)),
                            width: w,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: SizedBox(
                                      height: h / 10,
                                      child: Image.asset('assets/Logo-03.png')),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: w / 2.5,
                                      child: Text(
                                        "Racing Car made in china",
                                        style: TextStyle(
                                          fontSize: 12.dp,
                                          color: black1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Color Family -: purl white",
                                      style: TextStyle(
                                        fontSize: 12.dp,
                                        color: black1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      exchangeItem();
                                    },
                                    child: Card(
                                      elevation: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                            child: Image.asset(
                                                'assets/icons8-refresh-30.png')),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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

  exchangeItem() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Do you want to exchange this item',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: () {
        var w = MediaQuery.of(context).size.width;
        var h = MediaQuery.of(context).size.height;
        Navigator.pop(context);
        QuickAlert.show(
          // title: 'Item Exchange',
          showCancelBtn: true,
          text: 'Please type your exchange reason to Us',
          context: context,
          type: QuickAlertType.custom,
          barrierDismissible: true,
          confirmBtnText: 'Confirm',
          // customAsset: 'assets/Logo-06-08.png',
          headerBackgroundColor: AppColors.borderColor,
          widget: SingleChildScrollView(
            child: TextFormField(
              controller: exchangeText,
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10)),
                alignLabelWithHint: true,
                hintText: 'type here',
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onChanged: (value) => value,
            ),
          ),
          onConfirmBtnTap: () async {
            if (exchangeText.text.length < 20) {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'required more than 20 character',
              );
              return;
            }
            Navigator.pop(context);
            await Future.delayed(const Duration(milliseconds: 1000));
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: "Item exchange reqvest has been saved!.",
            );
            setState(() {
              exchangeText.clear();
            });
          },
        );
      },
      confirmBtnColor: Colors.green,
    );
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
