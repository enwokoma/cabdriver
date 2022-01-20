import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String? title;

  const TitleHeader({
    Key? key,
    this.title
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title!,
          style: dlHeadLineTextOne,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
