import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatingAccountScreen extends StatelessWidget {
  const CreatingAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getSize(context).width,
        height: getSize(context).height,
        padding: const EdgeInsets.only(top: 60, right: 18, left: 18),
        child: Column(
          children: [
            Text(
              AppStrings.dlAppName,
              style: dlTitleStyle,
            ),

            const SizedBox(height: 33,),

            SvgPicture.asset(
              'assets/images/vector/creating_account.svg'
            ),

            const SizedBox(height: 60,),

            Text(
              AppStrings.dlWelcomeMessage,
              style: dlTitleText4,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24,),

            Text(
              AppStrings.dlCreatingAccount,
              style: dlSubBodyTextOne,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 34,),

            const SpinKitThreeBounce(
              color: dlColorPrimary400,
              size: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
