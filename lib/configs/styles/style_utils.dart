// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_utils.dart';

class StyleConfig {
  // Common
  static const BorderRadiusGeometry commonBorderRadius =
      BorderRadius.all(Radius.circular(15.0));
  static const EdgeInsets commonPadding = EdgeInsets.all(20);
  static const EdgeInsets commonVerticlePadding =
      EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets commonHorizontalMargin =
      const EdgeInsets.symmetric(horizontal: 10);

  static StTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      Color? color}) {
    return GoogleFonts.montserrat(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        color: color);
  }

  // App Screen
  static EdgeInsets borderPadding = const EdgeInsets.all(15);

  // Alert Dialog
  static const EdgeInsets commoPaddingDialog = EdgeInsets.all(10);

  // Date & Time picker
  static const double alertDialogContentSizedBoxHeight = 328;
  static const double alertDialogContentSizedBoxWidth = 350;
  static const double dateTimePickerSizedBoxHeight = 200;

  // TextField
  static BorderRadius textFieldBorderRadius = BorderRadius.circular(16);
  static const TextStyle textFieldLabelStyle = TextStyle(fontSize: 14);
  static const EdgeInsets textFieldLabelPadding =
      EdgeInsets.only(left: 10, bottom: 10);

  // Checkbox
  static RoundedRectangleBorder checkBoxShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  static const TextStyle listTileCheckboxLabelStyle = TextStyle(fontSize: 14);

  // STButtons
  static BorderRadius stBorderRadius = BorderRadius.circular(10);

  static const BorderRadiusGeometry onlyTopBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const BoxDecoration loginScreenContainerDecoration = BoxDecoration(
    borderRadius: StyleConfig.onlyTopBorderRadius,
    color: ColorConfig.whiteColor,
  );
  static const BoxDecoration loginSNewPasswordContainerDecoration =
      BoxDecoration(
    color: ColorConfig.whiteColor,
    borderRadius: StyleConfig.commonBorderRadius,
  );
}
