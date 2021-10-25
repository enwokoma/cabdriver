import 'dart:convert';

import 'package:dio/dio.dart';

class RequestHelper{
  static Future<dynamic> getRequest(String url) async{
    try {
      Response response = await Dio().get(url);

      if(response.statusCode == 200){
        return response.data['results'][0]['formatted_address'];
      }else{
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Failed';
    }
  }

  static Future<dynamic> getRequestAll(String url) async{
    try {
      Response response = await Dio().get(url);

      if(response.statusCode == 200){
        return response.data;
      }else{
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Failed';
    }
  }
}