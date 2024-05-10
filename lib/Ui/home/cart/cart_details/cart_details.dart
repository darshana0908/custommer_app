import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:readmore/readmore.dart';

import '../../../../const/color.dart';
import '../../../../widget/appBar_button.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key, required this.img});
  final String img;

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  List miImg = ['assets/cover.jpg', 'assets/cover.jpg', 'assets/cover.jpg'];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List cart = [
    {'img': 'assets/a.PNG', 'p': 456},
    {'img': 'assets/a2.PNG', 'p': 156},
    {'img': 'assets/a3.PNG', 'p': 200},
    {'img': 'assets/a4.PNG', 'p': 156},
    {'img': 'assets/a6.PNG', 'p': 56},
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Baby Cream',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              child: SizedBox(
                height: h / 3.5,
                width: w,
                child: CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) {
                    return Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(20)),
                            child: SizedBox(
                              width: w,
                              child: Image.asset(cart[index]['img'],
                                  height: h / 3,
                                  fit: BoxFit.cover,
                                  width: w / 2),
                            ),
                          ),
                        ),
                        Container(
                          width: w,
                          height: h / 3,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    );
                  },
                  itemCount: cart.length,
                  // carouselController: _controller,
                  options: CarouselOptions(
                      // padEnds: true,
                      aspectRatio: 2.0,
                      autoPlay: true,
                      disableCenter: true,
                      viewportFraction: 0.4,
                      enlargeFactor: 10,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cart.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? white
                                : red)
                            .withOpacity(_current == entry.key ? 1 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rs 1245',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.dp),
                          ),
                          Text(
                            'Baby Item',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.dp,
                                color: black3),
                          ),
                        ],
                      ),
                      Card(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: red,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TabBar(
                      indicatorPadding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 7),
                      labelColor: white,
                      unselectedLabelColor: Colors.black45,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: appButtonColorLite),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Description"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Review"),
                          ),
                        ),
                      ]),
                  Container(
                    height: h,
                    child: TabBarView(children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          ReadMoreText(
                            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.ile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.ile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.ile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.ile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => review(),
                      ),
                      // Icon(Icons.games),
                    ]),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget review() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              'Anandha Samrakon',
              style: TextStyle(
                  color: black, fontSize: 17.dp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Anandha Samrakon Anandha Samrakon Anandha Samrakon',
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
              children: [cIcon(), cIcon(), cIcon(), cIcon(), cIcon2()],
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget cIcon() {
    return Icon(
      Icons.star_rounded,
      size: 25.dp,
      color: Colors.amber,
    );
  }

  Widget cIcon2() {
    return Icon(
      Icons.star_outline_rounded,
      size: 25.dp,
    );
  }
}
