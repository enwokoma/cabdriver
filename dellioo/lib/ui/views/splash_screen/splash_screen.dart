import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: dlColorPrimary400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Dellioo',
                style: dlMainAppNameStyle,
              ),
            ),
            const Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: SpinKitThreeBounce(
                color: dlColorWhite,
                size: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
