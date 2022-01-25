import 'package:flutter/material.dart';

Size getSize(BuildContext context){
  return MediaQuery.of(context).size;
}

const CONNECT_TIMEOUT = 30000;
const RECEIVE_TIMEOUT = 30000;
