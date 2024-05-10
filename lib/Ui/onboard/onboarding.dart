

import 'package:customer_app/Ui/login_and_signup/login.dart';
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:introduction_slider/source/presentation/pages/introduction_slider.dart';
import 'package:introduction_slider/source/presentation/widgets/buttons.dart';
import 'package:introduction_slider/source/presentation/widgets/dot_indicator.dart';
import 'package:introduction_slider/source/presentation/widgets/introduction_slider_item.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var h = 899.0;
  var w = 899.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: h,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.red])),
          child: AnimationLimiter(
            child: AnimationConfiguration.synchronized(
              child: IntroductionSlider(
                // showStatusBar: true,
                items: [
                  IntroductionSliderItem(
                    logo: Stack(
                      children: [
                        SizedBox(
                            height: h / 1.9,
                            width: w / 1.3,
                            child: Image.asset('assets/Lanka.png')),
                        Positioned(
                          right: w / 9,
                          child: SlideAnimation(
                              verticalOffset: 500.0,
                              duration: Duration(milliseconds: 1500),
                              child: FadeInAnimation(
                                duration: Duration(milliseconds: 500),
                                child: SizedBox(
                                    height: h / 8,
                                    child: Image.asset(
                                        'assets/branch logo-01-01.png')),
                              )),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "The onboarding carousel is a slideshowhe onboarding carousel is a slideshow  he onboarding carousel is a slideshow  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 12),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "The onboarding carousfffel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: white,
                            fontSize: 22.dp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 4, 48, 83),
                  ),
                  IntroductionSliderItem(
                    logo: SizedBox(
                        height: h / 1.9,
                        width: w / 1.3,
                        child: Image.asset('assets/Untitled-1.png')),
                    subtitle: Text(
                      "The onboarding carousel is a slideshowhe onboarding carousel is a slideshow  he onboarding carousel is a slideshow  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 12),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "The onboarding carousfffel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: white,
                            fontSize: 22.dp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 4, 48, 83),
                  ),
                  IntroductionSliderItem(
                    logo: SizedBox(
                        height: h / 1.9,
                        width: w / 1.3,
                        child: Image.asset('assets/branch logo-01-01.png')),
                    subtitle: Text(
                      "The onboarding carousel is a slideshowhe onboarding carousel is a slideshow  he onboarding carousel is a slideshow  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 12),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "The onboarding carousel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: white,
                            fontSize: 22.dp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    backgroundColor: Color.fromARGB(255, 4, 48, 83),
                  ),
                ],
                done: Done(
                  child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        child: Icon(Icons.done),
                      )),
                  home: Login(),
                ),
                next: Next(
                    child: Icon(
                  Icons.arrow_forward,
                  color: white2,
                )),
                back: Back(
                    child: Icon(
                  Icons.arrow_back,
                  color: white2,
                )),
                dotIndicator: DotIndicator(selectedColor: white2),
              ),
            ),
          ),
        ));
  }
}
