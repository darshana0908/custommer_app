import 'package:customer_app/Ui/home/profile/number_otp.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../const/color.dart';
import '../../../widget/diloag_button.dart';
import '../../../widget/textField.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              backgroundColor: Color.fromARGB(255, 247, 209, 17),
              child: Icon(
                Icons.add_ic_call_rounded,
                size: 30,
                // color: red,
              ),
              onPressed: () {
                update('Add New Phone Number', true);
              },
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: '2',
              backgroundColor: appButtonColorLite,
              child: Icon(
                Icons.home_sharp,
                size: 30,
              ),
              onPressed: () {
                update('New Shipping Address', false);
              },
            ),
          ],
        ),
      ),
      appBar: FadableAppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: statusBarColor),
        title: const Text('Profile'),
        centerTitle: true,
        foregroundColorOnFaded: black,
        foregroundColor: white,
        backgroundColor: appBarBlue,
        scrollController: _scrollController,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.2)),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Customer  Review',
                    style: TextStyle(
                        color: black2,
                        fontSize: 20.dp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Color.fromARGB(255, 91, 110, 143),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Anandha Samrakon',
                    style: TextStyle(
                        color: black2,
                        fontSize: 14.dp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Anandha Samrakon Anandha Samrakon Anandha Samrakon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: black2,
                      fontSize: 12.dp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [cIcon(), cIcon(), cIcon(), cIcon(), cIcon2()],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: w,
              decoration: BoxDecoration(
                  color: white1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.7, color: Color.fromARGB(31, 24, 22, 22))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: TextEditingController(),
                      icon: Icons.person,
                      text: 'Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: TextEditingController(),
                      icon: Icons.call,
                      text: 'Phone',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: TextEditingController(),
                      icon: Icons.call,
                      text: 'Home',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      // maxLines: 5,
                      // minLines: 2,

                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 50, top: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.2, color: white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: white,
                          prefixIcon: Icon(Icons.home),
                          hintText: 'Primary Billing Adders'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 50, top: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: white,
                          prefixIcon: Icon(Icons.airplanemode_on_outlined),
                          hintText: 'Shipping Billing Adders'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120,
          )
        ]),
      ),
    );
  }

  update(String title, bool isNumber) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundColor2,
        actionsOverflowAlignment: OverflowBarAlignment.start,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                title,
                style: TextStyle(
                    color: black, fontSize: 18.dp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // maxLines: 5,
                  // minLines: 2,

                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(bottom: 50, top: 0, left: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: white,
                      hintText: 'Type here'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DialogButton(
                buttonHeight: h / 15,
                width: w,
                text: 'Save',
                color: appButtonColorLite,
                onTap: () {
                  if (isNumber) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NumberCheckOtp(),
                        ));
                  }
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget cIcon() {
    return Icon(
      Icons.star_rounded,
      size: 30.dp,
      color: Colors.amber,
    );
  }

  Widget cIcon2() {
    return Icon(
      Icons.star_outline_rounded,
      size: 30.dp,
    );
  }
}
