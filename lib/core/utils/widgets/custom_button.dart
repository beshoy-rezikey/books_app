import 'package:flutter/material.dart';

import '../styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.textColor,
      this.borderRadius,
      required this.text,
      this.fontSize, this.onPressed});
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w900,
              color: textColor,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
