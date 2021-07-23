import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProgressDialog extends StatelessWidget {
  String message;
  ProgressDialog({this.message});
  //const ProgressDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //backgroundColor: Colors.blue[300],
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.circular(1.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                width: 6.0,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(
                width: 26.0,
              ),
              Text(
                message,
                style: TextStyle(color: Colors.black, fontSize: 13.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
