import 'package:dellioo/core/endpoints/endpoints.dart';
import 'package:dellioo/core/services/api/http_client.dart';
import 'package:dellioo/core/services/location/location_service.dart';

class LocationServiceImpl extends LocationService{
  HttpHelper httpHelper;

  LocationServiceImpl({required this.httpHelper});

  @override
  Future getPositionAddress({
    required double latitude,
    required double longitude,
    required String apiKey}) async{

    var uri = Endpoints.positionAddress(
        latitude: latitude,
        longitude: longitude,
        apiKey: apiKey
    );


  }



}