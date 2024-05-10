
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Card(
            elevation: 20,
            color: white,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            )),
      ),
    );
  }
}
