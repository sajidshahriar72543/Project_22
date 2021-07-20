import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_clone/AllWidgets/Divider.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newgoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Greetings",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'OpenSans-Regular',
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newgoogleMapController = controller;
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 320.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.0),
                    Text(
                      "Hello there! ",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Where to?",
                      style: TextStyle(
                          fontSize: 20.0, fontFamily: "Poppins-Regular"),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Search Drop off location"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Home"),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Your residence address",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    DividerWidget(),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Work"),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "Your office address",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
