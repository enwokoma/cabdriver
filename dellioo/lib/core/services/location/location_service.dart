
abstract class LocationService{

  Future<dynamic> getPositionAddress({
    required double latitude,
    required double longitude,
    required String apiKey
  });
}