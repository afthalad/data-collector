// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../../bloc/image/image_cubit.dart';
import '../../configs/styles/color_util.dart';
import '../../presentation/widgets/base widgets/st_button_widget.dart';

class ResetButton extends StatelessWidget {
  ResetButton({
    super.key,
    this.onClick,
    this.state = ErrorState,
  });
  final void Function()? onClick;
  var state;
  @override
  Widget build(BuildContext context) {
    return STButton(
      text: "Reset",
      textColor: ColorUtils.buttonColors,
      isBold: true,
      fontSize: 15,
      borderColor: ColorUtils.buttonColors,
      state: state,
      backgroundColor: ColorUtils.transparentColor,
      onClick: onClick,
    );
  }
}
