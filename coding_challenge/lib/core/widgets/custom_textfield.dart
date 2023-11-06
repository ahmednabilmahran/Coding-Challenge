// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom text field
class CustomTextField extends StatelessWidget {
  /// constructor
  const CustomTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.focusNode,
    this.label,
    this.readOnly = false,
    this.useBorder = false,
    this.borderRadius = 6,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.prefixWidget,
    this.suffixWidget,
    this.lines,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.fillColor,
    this.style,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.labelTextStyle,
    this.onTapOutside,
    this.autofillHints,
    this.hintStyle,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? hintText;

  final String? label;
  final TextInputType? keyboardType;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final int? lines;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool? readOnly;
  final bool useBorder;
  final TextStyle? labelTextStyle;
  final double? borderRadius;
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? style;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final void Function(PointerDownEvent)? onTapOutside;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            textAlign: TextAlign.left,
            style: labelTextStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.84,
                ),
          ),
        if (label != null) SizedX.h1p5,
        TextFormField(
          cursorColor: Theme.of(context).splashColor,
          readOnly: readOnly!,
          onTapOutside: onTapOutside ??
              (_) {
                FocusScope.of(context).unfocus();
              },
          enabled: enabled,
          autofillHints: autofillHints,
          validator: validator,
          focusNode: focusNode,
          autocorrect: false,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onChanged: onChanged,
          maxLines: lines ?? 1,
          maxLength: maxLength,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ??
                (enabled
                    ? Theme.of(context).cardColor
                    : Theme.of(context).scaffoldBackgroundColor),
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: '',
            errorMaxLines: 2,
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            suffixIconConstraints: BoxConstraints(minWidth: 15.w),
            hintText: hintText,
            hintStyle: hintStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).hintColor),
            contentPadding: EdgeInsets.symmetric(
              vertical: contentPaddingVertical ?? 2.5.h,
              horizontal: contentPaddingHorizontal ?? 4.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
              // borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: useBorder
                  ? const BorderSide(
                      color: Colors.grey,
                    )
                  : BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            errorStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).primaryColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).hoverColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
