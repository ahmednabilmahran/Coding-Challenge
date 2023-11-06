// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom button
class CustomButton extends StatelessWidget {
  /// constructor
  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    required this.isFilled,
    this.hasBorder = true,
    super.key,
    this.fillBackgroundColor,
    this.forceNotFillOnPressed = false,
    this.fillTextColor,
    this.notFillTextColor,
    this.notFillBackgroundColor,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final bool isFilled;
  final bool? forceNotFillOnPressed;
  final Color? fillBackgroundColor;
  final Color? notFillBackgroundColor;
  final Color? fillTextColor;
  final Color? notFillTextColor;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SizedX.zero,
      onPressed: isFilled
          ? onPressed
          : forceNotFillOnPressed!
              ? onPressed
              : null,
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(Size(double.infinity, 7.h)),
        backgroundColor: MaterialStateProperty.all<Color>(
          isFilled
              ? fillBackgroundColor ?? Theme.of(context).primaryColor
              : notFillBackgroundColor ??
                  Theme.of(context).scaffoldBackgroundColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: hasBorder
                  ? (isFilled
                      ? fillTextColor ?? Colors.transparent
                      : notFillTextColor ?? Theme.of(context).hoverColor)
                  : Colors.transparent,
            ),
          ),
        ),
      ),
      label: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
