import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 270,
          height: 270,
          child: SvgPicture.asset(
              'assets/images/vector/onboarding_third.svg'
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0),
          child: Text(
            AppStrings.dlRealTimeDeliveryTracking,
            style: dlTitleTextOne,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
