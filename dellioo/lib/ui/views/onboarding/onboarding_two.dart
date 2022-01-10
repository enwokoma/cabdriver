import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 270,
          height: 270,
          child: SvgPicture.asset(
              'assets/images/vector/onboarding_second.svg'
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0),
          child: Text(
            AppStrings.dlVarietyOfRideOptionsToChooseFrom,
            style: dlTitleTextOne,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
