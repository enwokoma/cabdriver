import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  final Function? backButtonPressed;
  final bool shouldShowTrailing;
  final Function? trailingPressed;
  final String trailingText;

  const AppTopBar({
    Key? key,
    @required this.backButtonPressed,
    this.trailingPressed,
    this.trailingText = '',
    this.shouldShowTrailing = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: dlColorPrimary400,
          ),
        ),

        if(shouldShowTrailing)
          GestureDetector(
          onTap: (){
            trailingPressed!();
          },
          child: Text(
            trailingText,
            style: dlHighlightButtonStyle,
          ),
        )
      ],
    );
  }
}
