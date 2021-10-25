import 'package:cab_driver/models/address_model.dart';
import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier{

  AddressModel? pickUpAddress;

  AddressModel? destinationAddress;
  void updatePickUpAddress(AddressModel pickUp){
    pickUpAddress = pickUp;
    notifyListeners();
  }

  void updateDestinationAddress(AddressModel destination){
    destinationAddress = destination;
    notifyListeners();
  }


}