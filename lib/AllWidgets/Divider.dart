import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  //const Divider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.0,
      color: Colors.grey[400],
      thickness: 1.0,
    );
  }
}
