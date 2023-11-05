import 'package:flutter/material.dart';
import 'package:short_point_test/core/utils/app_values.dart';
import 'package:short_point_test/core/utils/locale_helper.dart';
import 'package:short_point_test/core/utils/sized_x.dart';

/// Provides a custom app bar.
///
/// The custom app bar uses [PreferredSize] and offers several customization
/// options like [title], [haveBackButton], [onTitlePressed], etc.
///
/// The [context] parameter is used to access UI-related features.
/// The [title] defines the text to be shown at the center of the app bar.
/// If [haveBackButton] is true, a back button is shown at the top left corner.
/// The [onTitlePressed] callback is invoked when the title is tapped.
/// The [backButtonPressed] callback is invoked when the back button is tapped.
/// Optionally, an [actionWidget] and an [actionCallback] can be provided
/// to appear at the top right corner of the app bar.
PreferredSize customAppBar({
  required BuildContext context,
  required String title,
  required bool haveBackButton,
  VoidCallback? onTitlePressed,
  VoidCallback? backButtonPressed,
  Widget? actionWidget,
  VoidCallback? actionCallback,
}) {
  // Set the size of the custom app bar
  return PreferredSize(
    preferredSize:
        Size(MediaQuery.of(context).size.width, AppValues.appBarHeight),
    child: AppBar(
      // Configure various properties of the app bar
      backgroundColor: Theme.of(context).primaryColor,

      elevation: 0,
      title: InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTitlePressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      centerTitle: true,
      leading: haveBackButton
          ? InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: backButtonPressed ??
                  () {
                    Navigator.pop(context);
                  },
              child: Container(
                height: 30,
                width: 30,
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back,
                  textDirection: LocaleHelper.isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                ),
              ),
            )
          : SizedX.zero,
      leadingWidth: 70,
      actions: [
        if (actionWidget != null && actionCallback != null)
          Center(
            child: InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: actionCallback,
              child: actionWidget,
            ),
          )
        else
          SizedX.zero,
        SizedX.w4,
      ],
    ),
  );
}
