import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/ui/views/onboarding/onboarding_one.dart';
import 'package:dellioo/ui/views/onboarding/onboarding_three.dart';
import 'package:dellioo/ui/views/onboarding/onboarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingHome extends StatelessWidget {
  const OnboardingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: dlColorPrimary400,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50.0, right: 18, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    child: Text(
                      dlAppName,
                      style: dlMainAppSubNameStyle,
                    ),
                    visible: false,
                  ),

                  Text(
                    dlAppName,
                    style: dlMainAppSubNameStyle,
                  ),
                  Text(
                    dlAppName,
                    style: dlMainAppSubNameStyle,
                  )
                ],
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: PageView(
                children: const [
                  OnboardingOne(),
                  OnboardingTwo(),
                  OnboardingThree()
                ],
              ),
            ),
            Positioned(
              bottom: 50,
                right: 18,
                left: 18,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dlSkip,
                        style: dlButtonTextStyle,
                      ),

                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: dlColorWhite
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: dlColorPrimary400,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
