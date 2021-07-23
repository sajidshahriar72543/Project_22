import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';
import 'package:uber_clone/Models/address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation;

  void updatepickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
