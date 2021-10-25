import 'package:cab_driver/data_providers/app_data.dart';
import 'package:cab_driver/helpers/request_helper.dart';
import 'package:cab_driver/models/address_model.dart';
import 'package:cab_driver/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HelperMethods{
  static Future<String> findCoordinateAddress(Position position, BuildContext context) async{

    String placeAddress = '';

    String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapApiKeyAndroid';

    var address = await RequestHelper.getRequest(url);
    if(address != 'Failed'){

      placeAddress = address;
      AddressModel pickUpAddress = AddressModel(
        latitude: position.latitude,
        longitude: position.longitude,
        placeName: placeAddress
      );

      Provider.of<AppData>(context, listen: false).updatePickUpAddress(pickUpAddress);
    }

    return placeAddress;
  }
}