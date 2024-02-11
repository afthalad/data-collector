// ignore_for_file: prefer_typing_uninitialized_variables, avoid_init_to_null, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../bloc/image/image_cubit.dart';
import '../../../configs/styles/color_util.dart';

class STButton extends StatefulWidget {
  var state;
  final bool isBold;
  final String text;
  final double? width;
  final bool isEnable;
  final double? height;
  final IconData? icon;
  final Color? textColor;
  final double? fontSize;
  final bool showLoading;
  final bool isTextButton;
  final Color? borderColor;
  final String buttonType;
  final Color? backgroundColor;
  final double horizontalMargin;
  final void Function()? onClick;

  STButton({
    this.icon,
    this.buttonType = "normal",
    this.height = 56,
    this.borderColor,
    this.fontSize = 15,
    this.isBold = false,
    this.onClick = null,
    this.isEnable = false,
    this.text = "Continue",
    this.state = ErrorState,
    this.showLoading = false,
    this.isTextButton = false,
    this.horizontalMargin = 0,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.backgroundColor = ColorUtils.buttonColors,
    super.key,
  });

  @override
  State<STButton> createState() => _STButtonState();
}

class _STButtonState extends State<STButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.icon == null ? widget.height : 64,
      child: widget.buttonType == "normal"
          ? normalButton()
          : widget.buttonType == "icon"
              ? iconButton()
              : textButton(),
    );
  }

  Widget normalButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: widget.onClick,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: widget.borderColor != null
                ? BorderSide(
                    color: widget.borderColor!,
                    width: .9,
                  )
                : const BorderSide(
                    color: Colors.transparent,
                  ),
          ),
          backgroundColor: widget.backgroundColor,
        ),
        child: widget.state is LoadingState?
            ? const SpinKitThreeBounce(
                color: Colors.white,
                size: 20.0,
              )
            : Text(
                widget.text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: widget.textColor,
                      fontSize: widget.fontSize,
                      fontWeight:
                          widget.isBold ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
      ),
    );
  }

  Widget textButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: widget.onClick,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xFF313131),
              ),
        ),
      ),
    );
  }

  Widget iconButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton.icon(
        onPressed: widget.onClick,
        style: TextButton.styleFrom(
          side: widget.borderColor != null
              ? BorderSide(
                  color: widget.borderColor!,
                  width: .9,
                )
              : const BorderSide(
                  color: Colors.transparent,
                ),
          elevation: 0,
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(
          widget.icon,
          color: Colors.white,
        ),
        label: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: widget.textColor,
                fontSize: widget.fontSize,
                fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
