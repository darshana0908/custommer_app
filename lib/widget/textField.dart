import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../const/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.icon});
  final TextEditingController controller;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h / 15,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: black, fontSize: 13.dp),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: black2,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          hintStyle: TextStyle(fontSize: 13.dp, color: black1),
          hintText: text,
          fillColor: white,
        ),
      ),
    );
  }
}
