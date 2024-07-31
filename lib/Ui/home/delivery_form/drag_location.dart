import 'package:customer_app/Ui/conditions/custom_drawer/custom_drawer.dart';
import 'package:customer_app/const/color.dart';
import 'package:fadable_app_bar/fadable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../class/class.dart';
import '../../../widget/diloag_button.dart';
import 'delivery_form.dart';

class DragLocation extends StatefulWidget {
  const DragLocation({super.key});

  @override
  State<DragLocation> createState() => _DragLocationState();
}

class _DragLocationState extends State<DragLocation> {
  TextEditingController address = TextEditingController();
  TextEditingController number = TextEditingController(text: '0716232004');
  ScrollController _scrollController = ScrollController();
  Position? position;
  bool isOpen = false;
  bool sender = false;
  bool receiver = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    print(permission);
    if (permission == LocationPermission.deniedForever) {
      _checkLocationPermission();
      permission = await Geolocator.requestPermission();
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      position;
      print(position);
    });
  }

  Future<void> _checkLocationPermission() async {
    PermissionStatus permissionStatus = await Permission.location.status;
    if (permissionStatus == PermissionStatus.denied) {
      await openAppSettings().then((value) => getLocation());
    } else if (permissionStatus == PermissionStatus.granted) {}
  }

  @override
  void initState() {
    // getLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: backgroundColor2,
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: MyDrawer(),
      appBar: FadableAppBar(
        scrollController: _scrollController,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: statusBarColor),
        title: Text('Locations'),
        centerTitle: true,
        titleSpacing: 0,
        leading: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Image.asset('assets/icon-02.png')),
        foregroundColorOnFaded: black,
        foregroundColor: white,
        backgroundColor: appBarBlue,
        automaticallyImplyLeading: false,
      ),
      body:
          //  position == null
          // ? Loader().loader(context)
          // :
          AnimationLimiter(
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Flexible(
                        child: FlutterLocationPicker(
                            countryFilter: 'Sri',
                            selectLocationButtonPositionTop: -1000,
                            showSelectLocationButton: false,
                            contributorBadgeForOSMPositionTop: 10,
                            markerIcon: Image.asset(
                              'assets/location.png',
                              height: 90,
                            ),
                            loadingWidget: Loader().loader(context),
                            // initPosition: LatLong(
                            //     position!.latitude, position!.longitude),
                            showSearchBar: false,
                            initZoom: 6,
                            minZoomLevel: 5,
                            maxZoomLevel: 16,
                            trackMyPosition: true,
                            onError: (e) => print(e),
                            onPicked: (pickedData) {
                              print('ffffffffffffffffffffffffff');
                              print(pickedData.latLong.latitude);
                              print(pickedData.latLong.longitude);
                              print(pickedData.address);
                              print(pickedData.addressData['country']);
                            },
                            onChanged: (pickedData) {
                              print(pickedData.latLong.latitude);
                              print(pickedData.latLong.longitude);
                              print(pickedData.address);

                              setState(() {
                                address.text = pickedData.address;
                              });
                              print(pickedData.addressData);
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sender == false
                ? AnimationConfiguration.synchronized(
                    child: SlideAnimation(
                        duration: Duration(seconds: 2),
                        verticalOffset: 500.0,
                        child: accountTyp()))
                : pickupFrom(),
          ],
        ),
      ),
      bottomSheet: Column(mainAxisSize: MainAxisSize.min, children: [
        // accountTyp()
        // pickupFrom()
      ]),
    );
  }

  Widget pickupFrom() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.all(0),
      color: backgroundColor2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              'Pickup from',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black, fontSize: 14.dp, fontWeight: FontWeight.bold),
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              controller: address,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  prefixIcon: Icon(
                    Icons.pin_drop,
                    size: 32,
                    color: appButtonColorLite,
                  )),
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              controller: number,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                  label: Text(
                    'sajith',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  prefixIcon: Icon(
                    Icons.person_4_outlined,
                    size: 32,
                    color: Colors.black45,
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.description_sharp,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Edit Item details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: black,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'Note : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: red,
                      fontSize: 11.dp,
                      fontWeight: FontWeight.normal),
                ),
                Flexible(
                  child: Text(
                    'Note Note Note NoteNoteNote NoteNote NoteNote',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: black1,
                        fontSize: 11.dp,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DialogButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryForm(),
                        ));
                  },
                  buttonHeight: h / 15,
                  width: w,
                  color: appButtonColorLite),
            )
          ],
        ),
      ),
    );
  }

  move() {
    setState(() {
      sender = true;
      print(sender);
    });
  }

  Widget accountTyp() {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      color: backgroundColor2,
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            'Account Type (Pay By)',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: black, fontSize: 14.dp, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () async {
                  move();
                },
                child: Card(
                  color: Color.fromARGB(121, 255, 207, 204),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          '  Sender  ',
                          style: TextStyle(
                              color: black1,
                              fontSize: 11.dp,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          'assets/delivery-truck_400561.png',
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  move();
                },
                child: Card(
                  color: Color.fromARGB(255, 202, 219, 249),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          'Receiver',
                          style: TextStyle(
                              color: black1,
                              fontSize: 11.dp,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          'assets/recipient_3900672.png',
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
