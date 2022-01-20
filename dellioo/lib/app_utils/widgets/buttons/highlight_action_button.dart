import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';

class HighLightActionButton extends StatelessWidget {
  final String? actionText;
  final Function? onPressed;

  const HighLightActionButton({
    Key? key,
    this.actionText,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed!();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: dlColorPrimary300.withOpacity(.5), width: 1.8),
          borderRadius: BorderRadius.circular(14)
        ),
        height: 64,
        width: getSize(context).width,
        child: Center(
          child: Text(
            actionText!,
            style: dlHighlightButtonStyle,
          ),
        ),
      ),
    );
  }
}
