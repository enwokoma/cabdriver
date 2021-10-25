import 'dart:async';

import 'package:cab_driver/app_widgets/brand_divider.dart';
import 'package:cab_driver/app_widgets/progress_dialog.dart';
import 'package:cab_driver/data_providers/app_data.dart';
import 'package:cab_driver/helpers/helper_methods.dart';
import 'package:cab_driver/screens/search_screen.dart';
import 'package:cab_driver/utils/brand_colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;
  double mapPaddingButtom = 0;
  Geolocator geoLocator = Geolocator();
  Position? currentPosition;

  List<LatLng> polyLineCoordinates = [];
  Set<Polyline> _polyLines = {};

  void _determinePosition() async {
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

    String address = await HelperMethods.findCoordinateAddress(currentPosition!, context);
    print('current address is $address');
  }

  static final CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapPaddingButtom),
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: true,
            polylines: _polyLines,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
              mapController = controller;
              setState(() {
                mapPaddingButtom = 270;
              });
              _determinePosition();
            },
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7)
                  ),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 5,),
                    const Text('Nice to see you', style: TextStyle(
                      fontSize: 10,
                    ),),
                    const Text('Where are you going', style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Brand-Bold'
                    ),),

                    const SizedBox(height: 20,),

                    GestureDetector(
                      onTap: () async{
                        var response = await Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const SearchScreen())
                        );

                        if(response == 'getDirection'){
                          await getDirection();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7)
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: const[
                             Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ),
                             SizedBox(width: 10,),
                              Text('Search Destination')
                            ],
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(height: 22,),

                    Row(
                      children: [
                        Icon(Icons.home, color: BrandColors.colorDimText,),
                        SizedBox(width:12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const  Text(
                              'Add Home'
                            ),
                            const SizedBox(width:3),
                            const Text(
                              'Your residental address',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: BrandColors.colorDimText
                              ),
                            )
                          ],
                        ),

                      ],
                    ),

                    const SizedBox(height:10),
                    const BrandDivider(),

                    const SizedBox(height:16),
                    Row(
                      children: [
                        Icon(Icons.work, color: BrandColors.colorDimText,),
                        SizedBox(width:12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const  Text(
                                'Add Work'
                            ),
                            const SizedBox(width:3),
                            const Text(
                              'Your office address',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: BrandColors.colorDimText
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getDirection() async{
    var pickUp = Provider.of<AppData>(context, listen: false).pickUpAddress;
    var destination = Provider.of<AppData>(context, listen: false).destinationAddress;

    var pickUpLatLng = LatLng(pickUp!.latitude!, pickUp.longitude!);
    var destinationLatLng = LatLng(destination!.latitude!, destination.longitude!);

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const ProgressDialog(status: 'Please wait....')
    );
    var thisDetails = await HelperMethods.getDirectionDetails(pickUpLatLng, destinationLatLng);

    Navigator.pop(context);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> results = polylinePoints.decodePolyline(thisDetails!.encodedPoints!);

    polyLineCoordinates.clear();

    if(results.isNotEmpty){
      results.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    _polyLines.clear();

    setState(() {
      Polyline polyline = Polyline(
          polylineId: const PolylineId('polyid'),
          color: const Color.fromARGB(255, 95, 109, 237),
          points: polyLineCoordinates,
          jointType: JointType.round,
          width: 4,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true
      );

      _polyLines.add(polyline);

    });

  }
}
