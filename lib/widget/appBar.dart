import 'package:customer_app/const/color.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar {
  bar(
      ScrollController controller,
      Color color,
      Color color2,
      VoidCallback onTap,
      VoidCallback onTap2,
      IconData icon2,
      bool actionButton,
      GlobalKey<ScaffoldState> _key) {
    return FadableAppBar(
      leading: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Image.asset('assets/icon-02.png')),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: statusBarColor),
      actions: [
        actionButton
            ? IconButton(onPressed: onTap2, icon: Icon(icon2))
            : SizedBox()
      ],
      foregroundColorOnFaded: color,
      foregroundColor: color2,
      backgroundColor: appliteBlue,
      scrollController: controller,
      automaticallyImplyLeading: false,
    );
  }
}
