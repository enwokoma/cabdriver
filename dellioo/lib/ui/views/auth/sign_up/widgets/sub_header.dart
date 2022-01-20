import 'package:dellioo/app_utils/styles/texts.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final String? subHeaderText;

  const SubHeader({
    Key? key,
    @required this.subHeaderText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: getSize(context).width * .9,
          child: Text(
            subHeaderText!,
            style: dlBodyTextOne,
          ),
        )
      ],
    );
  }
}
