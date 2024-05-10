
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class GmailButton extends StatefulWidget {
  const GmailButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.buttonHeight,
      required this.width,
      required this.color});
  final String text;
  final VoidCallback onTap;
  final double buttonHeight;
  final double width;
  final Color color;

  @override
  State<GmailButton> createState() => _GmailButtonState();
}

class _GmailButtonState extends State<GmailButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          tap = false;
        });
      },
      onTap: widget.onTap,
      mouseCursor: MouseCursor.defer,
      child: AnimatedOpacity(
        opacity: tap ? 0.2 : 1,
        duration: Duration(milliseconds: 60),
        child: Container(
          padding: EdgeInsets.all(4),
          alignment: Alignment.center,
          height: widget.buttonHeight,
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(),
            color: black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            // gradient: LinearGradient(
            //     colors: [widget.color, Colors.black],
            //     begin: Alignment.centerLeft,
            //     end: Alignment.bottomRight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(child: Image.asset('assets/icons8-google-48.png')),
              Text('Login With Google',
                  style: TextStyle(
                      color: white,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
