import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ActionButton extends StatelessWidget {
  final Function? onPressed;
  final Color color;
  final Color textColor;
  final String? text;
  final bool disabled;
  final Widget? icon;
  final double borderRadius;
  final double height;
  final double textFontSize;
  final bool isLoading;
  final Color disabledColor;
  final Color disabledTextColor;

  ActionButton({
    Key? key,
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
    this.color = dlColorPrimary400,
    this.textColor = dlColorWhite,
    this.icon,
    this.borderRadius = 12.0,
    this.height = 50.0,
    this.textFontSize = 16.0,
    this.isLoading = false,
    this.disabledColor = dlColorBlackGrey5,
    this.disabledTextColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return Align(
      alignment: Alignment.center,
      child: Opacity(
        opacity: disabled ? .8 : 1,
        child: Container(
          height: height,
          // width: MediaQuery.of(context).size.width * .7,
          child: FlatButton(
            onPressed: (){
              disabled || isLoading ? null : onPressed;
            },
            disabledColor: disabledColor ?? color,
            color: disabled ? disabledColor : color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    minHeight: height),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon == null ? const SizedBox() : icon!,
                    //  icon == null ? SizedBox() : Icon(icon, size: 27),
                    Padding(
                      padding: scaler.insets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: isLoading
                          ? SpinKitThreeBounce(
                        color: textColor ?? Colors.white,
                        size: 24.0,
                      )
                          : Text(
                        isLoading ? 'Please wait...' : text!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: disabled
                                ? disabledTextColor
                                : textColor ?? Colors.white,
                            letterSpacing: .8,
                            fontSize: textFontSize,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}