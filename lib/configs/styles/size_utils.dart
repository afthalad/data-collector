import 'package:flutter/widgets.dart';

class SizesUtils {
  final BuildContext context;

  SizesUtils(this.context);

  static EdgeInsetsGeometry getDropDownHorizontalPadding(BuildContext context) {
    final double paddingValue = MediaQuery.of(context).size.width * 0.02;
    return EdgeInsets.symmetric(horizontal: paddingValue);
  }

  static EdgeInsetsGeometry getDropDownOnlyLeftPadding(BuildContext context) {
    final double paddingValue = MediaQuery.of(context).size.width * 0.02;
    return EdgeInsets.only(left: paddingValue);
  }

  static EdgeInsetsGeometry defualtPadding(BuildContext context) {
    final double paddingValue = MediaQuery.of(context).size.width * 0.035;
    return EdgeInsets.symmetric(horizontal: paddingValue, vertical: 5);
  }

  static EdgeInsetsGeometry customPadding(
      BuildContext context, double padding) {
    final double paddingValue = MediaQuery.of(context).size.width * padding;
    return EdgeInsets.symmetric(horizontal: paddingValue, vertical: 5);
  }

  static EdgeInsetsGeometry getDropDownHorizontalMargin(BuildContext context) {
    final double paddingValue = MediaQuery.of(context).size.width * 0.01;
    return EdgeInsets.symmetric(horizontal: paddingValue);
  }

  static EdgeInsetsGeometry getDropDownHorizontalCustomMargin(
      BuildContext context, num size) {
    final double paddingValue = MediaQuery.of(context).size.width * size;
    return EdgeInsets.symmetric(horizontal: paddingValue);
  }

  final defaultBorderRadius = BorderRadius.circular(10);
}
