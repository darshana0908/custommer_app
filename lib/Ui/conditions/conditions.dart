import 'package:customer_app/Ui/navigation/navigation.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../const/color.dart';

class condition extends StatefulWidget {
  condition({super.key});

  @override
  State<condition> createState() => _conditionState();
}

class _conditionState extends State<condition> {
  ScrollController _scrollController = ScrollController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Decline',
              style: TextStyle(color: appButtonColorLite),
            ),
            width: w / 2.5,
            height: h / 16,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: appButtonColorLite)),
          ),
        ),
        check
            ? InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Accept',
                    style: TextStyle(color: white),
                  ),
                  width: w / 2.5,
                  height: h / 16,
                  decoration: BoxDecoration(
                      color: appButtonColorLite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                ),
              )
            : SizedBox()
      ],
      appBar: FadableAppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Color.fromARGB(255, 43, 75, 79)),
        title: const Text('Terms And Conditions'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        foregroundColorOnFaded: black,
        foregroundColor: white,
        backgroundColor: appliteBlue,
        scrollController: _scrollController,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Scrollbar(
          trackVisibility: true,
          thumbVisibility: true,
          thickness: 7,
          radius: Radius.circular(5),
          interactive: true,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'nspirational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results... ational designs, illustrations, and graphic elements from the world’s best designers.Want more \n\ninspiration? Browse our search results... ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results... ational designs, illus\n\ntrations, and graphic elements ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’\ns best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs,\n\n illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’s \nbest designers.Want more inspiration? Browse our search results...ational designs, illustrations, and graphic elements from the world’\ns best designers.Want more inspiration? Browse our search results...from the world’s best designers.Want more inspiration? Browse our search results... ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: black,
                      fontSize: 12.dp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: white,
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = value!;
                      });
                    },
                  ),
                  Text(
                    "I've read all terms and conditions",
                    style: TextStyle(color: appButtonColorLite),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
