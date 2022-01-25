import 'package:dellioo/core/config/config_reader.dart';
import 'package:dellioo/core/enums/environment.dart';

class Config {
  static Environment? envStatus;
  String? baseURL;

  Config() {

    if (envStatus == Environment.PROD) {
      baseURL = ConfigReader.getProdUrl()!;
    } else {
      baseURL = ConfigReader.getDevUrl()!;
    }
  }
}