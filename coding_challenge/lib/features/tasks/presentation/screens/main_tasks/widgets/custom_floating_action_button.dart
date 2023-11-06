// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Container(
        width: 7.h,
        height: 7.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF3556AB),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF113EB1),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
