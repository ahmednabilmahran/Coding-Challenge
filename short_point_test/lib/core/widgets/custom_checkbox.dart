// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:short_point_test/core/utils/assets.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({required this.isChecked, super.key, this.onChanged});
  final bool isChecked;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!isChecked),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: isChecked
            ? SvgPicture.asset(Assets.genIconsCheckIcon)
            : SvgPicture.asset(Assets.genIconsUncheckIcon),
      ),
    );
  }
}
