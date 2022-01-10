import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 270,
          height: 270,
          child: SvgPicture.asset(
              'assets/images/vector/onboarding_first.svg'
          ),
        ),
      ],
    );
  }
}
