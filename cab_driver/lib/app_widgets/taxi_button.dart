import 'package:cab_driver/utils/brand_colors.dart';
import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {
  final String? title;
  final Color? buttonColor;
  final Function? onPressed;


  const TaxiButton({
    Key? key,
    @required this.title,
    @required this.buttonColor,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        onPressed!();
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26)
      ),
      color: buttonColor,
      textColor: Colors.white,
      child: Text(
        title!,
        style: TextStyle(fontSize: 18, fontFamily: "Brand-Bold"),
      ),
    );
  }
}