import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/ui/views/onboarding/onboarding_home.dart';
import 'package:dellioo/ui/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppStrings.dlAppName,
      home: const OnboardingHome(),
    );
  }
}
