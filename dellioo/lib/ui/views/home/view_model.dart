import 'dart:async';

import 'package:dellioo/ui/base/base_view_model.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewModel extends BaseViewModel{

  List<LatLng> polyLineCoordinates = [];
  Set<Polyline> polyLines = {};
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  Position? currentPosition;
  GoogleMapController? mapController;
  Completer<GoogleMapController> completerController = Completer();



  double _mapPaddingButtom = 0;
  double get mapPaddingButtom => _mapPaddingButtom;
  set mapPaddingButtom(double val){
    _mapPaddingButtom = val;
    notifyListeners();
  }

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  init() {

  }

  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    LatLng pos = LatLng(currentPosition!.latitude, currentPosition!.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController!.animateCamera(CameraUpdate.newCameraPosition(cp));

  }

  onMapCreated(GoogleMapController controller, BuildContext context){
    completerController.complete(controller);
    mapController = controller;
    mapPaddingButtom = getSize(context).height * 0.38;
    determinePosition();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}