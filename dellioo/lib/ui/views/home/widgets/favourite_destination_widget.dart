import 'package:dellioo/app_utils/styles/colors.dart';
import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';

class FavouriteDestinationsWidget extends StatelessWidget {
  final String? text;
  final Widget? icon;

  const FavouriteDestinationsWidget({
    Key? key,
    required this.text,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 86,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
          color: dlColorBlackGrey7,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,

          const SizedBox(height: 4,),

          Text(
              text!,
            style: dlSubBodyTextOne,
          )
        ],
      ),
    );
  }
}