import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/providers/set_up.dart';
import 'package:dellioo/ui/views/home/home.dart';
import 'package:dellioo/ui/views/onboarding/onboarding_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DelliooApp extends StatelessWidget {
  final bool? isDebug;

  const DelliooApp({
    Key? key,
    this.isDebug
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: providers,
        child: MaterialApp(
        debugShowCheckedModeBanner: isDebug!,
        title: AppStrings.dlAppName,
        home: const HomeScreen(),
      ),
    );
  }
}
