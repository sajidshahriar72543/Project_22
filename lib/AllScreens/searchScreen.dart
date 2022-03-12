import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber_clone/DataHandler/appData.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String placeAddress = Provider.of<AppData>(context).pickUpLocation.placeName ?? "";
    pickUpTextEditingController.text = placeAddress;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215.0,
            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back
                          ),
                      ),
                      Center(
                        child: Text("Set Drop off", style: TextStyle(fontSize: 18.0, fontFamily: "Poppins-Regular")),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0),
                  
                  Row(
                    children: [
                      Image.asset("images/pickicon.png", height: 16.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              controller: pickUpTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey[400],
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
                                border: InputBorder.none,
                                hintText: "Pickup Location",
                                hintStyle: TextStyle(fontSize: 14.0, fontFamily: "Poppins-Regular"),
                              ),
                            ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Image.asset("images/desticon.png",
                          height: 16.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              controller: dropOffTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey[400],
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                border: InputBorder.none,
                                hintText: "Where to?",
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "Poppins-Regular"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}