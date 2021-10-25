import 'package:cab_driver/data_providers/app_data.dart';
import 'package:cab_driver/helpers/request_helper.dart';
import 'package:cab_driver/models/address_model.dart';
import 'package:cab_driver/models/direction_details.dart';
import 'package:cab_driver/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  static Future<DirectionDetails?> getDirectionDetails(LatLng startPosition, LatLng endPosition) async{

    String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition.latitude},${startPosition.longitude}&destination=${endPosition.latitude},${endPosition.longitude}&mode=driving&key=$mapApiKeyAndroid';
    print('url here is $url');
    var response = await RequestHelper.getRequestAll(url);

    if(response == 'Failed'){
      return null;
    }

    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.durationText = response['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue = response['routes'][0]['legs'][0]['duration']['value'];

    directionDetails.distanceText = response['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue = response['routes'][0]['legs'][0]['distance']['value'];

    directionDetails.encodedPoints = response['routes'][0]['overview_polyline']['points'];

    return directionDetails;
  }
}