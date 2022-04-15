import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber_clone/Assistants/requestAssistant.dart';
import 'package:uber_clone/DataHandler/appData.dart';
import 'package:uber_clone/configMaps.dart';
import 'package:uber_clone/Models/placePredictions.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  List<PlacePredictions> placePredictionsList = [];

  @override
  Widget build(BuildContext context) {
    String placeAddress =
        Provider.of<AppData>(context).pickUpLocation.placeName ?? "";
    pickUpTextEditingController.text = placeAddress;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
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
                  SizedBox(height: 35.0),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      Center(
                        child: Text("Set Drop off",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Poppins-Regular",
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Image.asset("images/pickicon.png",
                          height: 16.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              controller: pickUpTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                border: InputBorder.none,
                                hintText: "Pickup Location",
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
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Image.asset("images/desticon.png",
                          height: 16.0, width: 16.0),
                      SizedBox(width: 18.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              onChanged: (val) {
                                findPlace(val);
                              },
                              controller: dropOffTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
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
          ),
          // tile for display predictions
          (placePredictionsList.length > 0)
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListView.separated(
                    padding: EdgeInsets.all(0.0),
                    itemBuilder: (context, index) {
                      return PredictionTile(
                          placePredictions: placePredictionsList[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: placePredictionsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ))
              : Container(),
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapkey&components=country:BD";
      var res = await RequestAssistant.getRequest(autoCompleteUrl);
      if (res == "failed") {
        return;
      }
      // print(res);

      if (res["status"] == "OK") {
        var predictions = res["predictions"];
        var placesList = (predictions as List)
            .map((e) => PlacePredictions.fromJson(e))
            .toList();
        setState(() {
          placePredictionsList = placesList;
        });
      }
    }
  }
}

class PredictionTile extends StatelessWidget {
  final PlacePredictions placePredictions;
  PredictionTile({Key key, this.placePredictions, this.title = ''})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(width: 10.0),
        Row(
          children: [
            Icon(Icons.add_location),
            SizedBox(width: 14.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(placePredictions.main_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Poppins-Regular",
                          color: Colors.black)),
                  SizedBox(height: 3.0),
                  // Text(placePredictions.secondary_text,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: TextStyle(
                  //         fontSize: 16.0,
                  //         fontFamily: "Poppins-Regular",
                  //         color: Colors.black)),
                ],
              ),
            )
          ],
        ),
        SizedBox(width: 10.0),
      ],
    ));
  }
}
