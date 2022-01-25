import 'package:flutter/material.dart';
import 'package:uiconversion/app/styles/text_styles.dart';

class TopButton extends StatelessWidget {
  final String? text;

  const TopButton({
    Key? key,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: const Color(0xFF011971),
            borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            text!,
            style: appBoldStyleSmaller,
          ),
        ),
      ),
    );
  }
}
