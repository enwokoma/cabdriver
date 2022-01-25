
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConfigReader {

  static String? getDevUrl() {
    return dotenv.env['API_GOOGLE_BASE_URL'];
  }

  static String? getProdUrl(){
    return dotenv.env['API_GOOGLE_BASE_URL'];
  }
}