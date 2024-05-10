import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../const/color.dart';
import '../../../widget/diloag_button.dart';
import '../../../widget/textField.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: backgroundColor2,
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Get in touch',
              style: TextStyle(
                  fontSize: 18.dp, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Use our contact form for all information requests or contact us directly using the contact information below.\n\nFeel free to get in touch with us via email or phone Our Office Location',
              style: TextStyle(
                  fontSize: 12.dp, fontWeight: FontWeight.normal, color: black),
            ),
            Divider(),
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 18.dp,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: w,
                    height: h / 17,
                    child: CustomTextField(
                        icon: Icons.person_2_outlined,
                        controller: userName,
                        text: 'name'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: w,
                    height: h / 17,
                    child: CustomTextField(
                        icon: Icons.email_outlined,
                        controller: userName,
                        text: 'email'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: w,
                    child: TextFormField(
                      maxLines: 6,
                      minLines: 6,
                      style: TextStyle(color: black, fontSize: 13.dp),
                      validator: (value) {},
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
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
                        hintText: 'Type here',
                        fillColor: white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DialogButton(
                    buttonHeight: h / 14,
                    color: appButtonColorLite,
                    onTap: () {},
                    text: 'SEND',
                    width: w,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: w / 5,
                    child: IconButton(
                      onPressed: () {
                        MapUtils.openMap(5.426475, 82.008898);
                      },
                      icon: Icon(
                        Icons.pin_drop,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Office Location',
                          style: TextStyle(
                              fontSize: 14.dp,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        Text(
                          'The Interior Design Studio Company The Courtyard, Al Quoz 1, Colorado, USA Phone (Landline)',
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal,
                              color: black1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  SizedBox(
                    width: w / 5,
                    child: IconButton(
                      onPressed: () async {
                        final call = Uri.parse('tel:+91 9830268966');
                        if (await canLaunchUrl(call)) {
                          launchUrl(call);
                        } else {
                          throw 'Could not launch $call';
                        }
                      },
                      icon: Icon(
                        Icons.call,
                        color: appButtonColorLite,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone (Landline)',
                          style: TextStyle(
                              fontSize: 14.dp,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        Text(
                          '0716232004',
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal,
                              color: black1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12)),
              child: Row(
                children: [
                  SizedBox(
                    width: w / 5,
                    child: IconButton(
                      onPressed: () async {
// #docregion encode-query-parameters
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'smith@example.com',
                        );

                        launchUrl(emailLaunchUri);
// #enddocregion encode-query-parameters
                      },
                      icon: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14.dp,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        Text(
                          'Koombiyo@gmail.com',
                          style: TextStyle(
                              fontSize: 12.dp,
                              fontWeight: FontWeight.normal,
                              color: black1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ]),
        ),
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
