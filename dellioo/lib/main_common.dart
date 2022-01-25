import 'dart:async';
import 'package:dellioo/app/locator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dellioo/app_widget.dart';
import 'package:dellioo/core/config/config.dart';
import 'package:dellioo/core/enums/environment.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(Environment environ) async {
  WidgetsFlutterBinding.ensureInitialized();


  await dotenv.load(fileName: ".env");
  await setUpLocator();
  //restrict orientation to Portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Config.envStatus = environ;

  runApp(DelliooApp(
    isDebug: environ == Environment.DEV,
  ));

}