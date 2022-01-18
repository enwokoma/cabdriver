import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/buttons/highlight_action_button.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';

class ResendCodeModal extends StatelessWidget {
  const ResendCodeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: getSize(context).height * .4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: dlColorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Text(
              AppStrings.dlResendVerificationCode,
            style: dlTitleTextTwo,
          ),
          const SizedBox(height: 20,),

          const HighLightActionButton(
            actionText: 'Cancel',
          ),

          const SizedBox(height: 20,),

          ActionButton(
              text: AppStrings.dlResend,
              onPressed: null
          ),

        ],
      ),
    );
  }
}
