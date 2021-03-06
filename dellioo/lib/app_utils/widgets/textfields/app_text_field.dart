import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/strings.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final Color? borderColor;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const AppTextField({
    Key? key,
    this.focusNode,
    this.borderColor = Colors.transparent,
    this.hintText,
    this.prefixIcon,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 58,
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor!, width: 1.8),
            color: dlBackgroundColor.withOpacity(.06),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          focusNode: focusNode,
          cursorColor: dlColorBlackGrey1,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            prefixIcon: prefixIcon
          ),
        ));
  }

}
