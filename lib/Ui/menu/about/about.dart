
import 'package:customer_app/const/color.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: FadableAppBar(
        title: Text('About Us'),
        centerTitle: true,
        foregroundColorOnFaded: black,
        foregroundColor: white,
        backgroundColor: appliteBlue,
        scrollController: _scrollController,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            card(
              'Our Vision',
              'Our aim is to act as an indispensable partner to our clients by helping them build and maximize sustainable competitive advantages. We do this by helping them get their products to end customer quickly, efficiently, and safely. In addition to our expertly crafted and reliably delivered logistics solutions, our clients can rest assured that every interaction will be driven by integrity and respect, the fundamental principles of our business',
            ),
            card(
              'Our Mission',
              'Our mission is to deliver a positive, reliable experience to each and every one of our clients while offering exceptional value in the marketplace and setting the standard for professionalism in the logistic solutions we provide. In addition to operating our business profitably, we strive to operate it responsibly both for our clients and our employees, for whom our goal is to provide a safe and secure work environment.',
            ),
            card(
              'Our Network',
              'We are currently operating with 85+ branches island wide land to provide our customers with the reliable, efficient delivery, need for their regional and domestic shipments. Our service is unparalleled thanks to our wide network of professional providers and our commitment to keeping our customers informed with up-to-date, accurate information on their shipments.',
            ),
            card(
              'Our Network',
              '+ Real-time updates on shipment location\n\n+ Guaranteed professional service at highly competitive rates\n\n+ Special service for expedited transport of time-critical shipments\n\n+ Door-to-door Delivery Island wide',
            ),
          ]),
        ),
      ),
    );
  }

  Widget card(String text, String text2) {
    return Card(
      elevation: 0.2,
      color: Color.fromARGB(252, 243, 241, 241),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18.dp,
                color: black1,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 14.dp,
                color: black2,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
