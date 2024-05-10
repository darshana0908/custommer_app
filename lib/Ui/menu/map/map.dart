import 'dart:async';

import 'package:customer_app/const/color.dart';
import 'package:customer_app/widget/diloag_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../class/class.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Position? position;
  bool isOpen = false;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Marker> _marker = {};
  final List list = const [
    // List of Markers Added on Google Map
    {'mackerid': '1', 'lat': 37.42796133580664, 'lon': -122.085749655962},
    {'mackerid': '2', 'lat': 37.43296265331129, 'lon': -122.08832357078792},
    {'mackerid': '3', 'lat': 37.43000050794691, 'lon': -122.07619763910769},
    {'mackerid': '4', 'lat': 37.41004037788256, 'lon': -122.08433948457241},
  ];

  userLocation() {
    List.generate(list.length, (index) {
      Set<Marker> _markertemp = {
        Marker(
            consumeTapEvents: true,
            onTap: () async {
              // userDiloage();
              setState(() {
                isOpen = true;
              });

              print(list[index]['mackerid']);
            },
            draggable: true,
            visible: true,
            markerId: MarkerId(list[index]['mackerid']),
            position: LatLng(list[index]['lat'], list[index]['lon'])),
      };
      _marker.addAll(_markertemp);
    });
    print(_marker);
  }

  @override
  void initState() {
    getLocation();
    // TODO: implement initState
    super.initState();
  }

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
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      backgroundColor: Color.fromARGB(255, 229, 232, 238),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: position == null
            ? Loader().loader(context)
            : SizedBox(
                height: h,
                child: Column(
                  children: [
                    SizedBox(),
                    Expanded(
                      child: GoogleMap(
                        onCameraMoveStarted: () {},
                        padding: EdgeInsets.only(
                          top: h / 2.0,
                        ),
                        // on below line specifying map type.
                        mapType: MapType.normal,
                        // on below line setting user location enabled.
                        myLocationEnabled: true,
                        // on below line setting compass enabled.

                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(position!.latitude, position!.longitude),
                          zoom: 11.4746,
                        ),
                        onTap: (argument) {
                          // MapUtils.openMap(
                          //     argument.latitude, argument.longitude);
                        },
                        markers: _marker,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DialogButton(
                          text: 'Confirm My Location',
                          onTap: () {},
                          buttonHeight: h / 16,
                          width: w / 1.5,
                          color: appButtonColorLite),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
