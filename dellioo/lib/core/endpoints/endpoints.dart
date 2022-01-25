class Endpoints{

  static String positionAddress({
    double? latitude,
    double? longitude,
    String? apiKey
  }) =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
}