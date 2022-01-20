import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/app_utils/widgets/buttons/action_button.dart';
import 'package:dellioo/app_utils/widgets/buttons/highlight_action_button.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';

class AppModal extends StatelessWidget {
  final String? bigText;
  final String? subText;
  final String? mainButtonText;
  final String? highLightButtonText;
  final Function? highLightButtonClicked;
  final Function? mainButtonClicked;
  final double? height;

  const AppModal({
    Key? key,
    @required this.bigText,
    this.subText,
    @required this.mainButtonText,
    @required this.highLightButtonText,
    @required this.highLightButtonClicked,
    @required this.mainButtonClicked,
    @required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: height,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                bigText!,
                style: dlTitleTextTwo,
              ),
            ],
          ),

          if(subText != null)
            const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                subText ?? '',
                style: dlSubBodyTextOne,
              ),
            ],
          ),

          const SizedBox(height: 20,),

           HighLightActionButton(
            actionText: highLightButtonText!,
            onPressed: (){
              highLightButtonClicked!();
            },
          ),

          const SizedBox(height: 20,),

          ActionButton(
              text: mainButtonText,
              onPressed: (){
                mainButtonClicked!();
              }
          ),

        ],
      ),
    );
  }
}
