import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../configs/styles/color_utils.dart';
import '../../../configs/styles/style_utils.dart';

class StTextField extends StatefulWidget {
  final TextEditingController? textController;
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool isNumber;
  final bool isEmail;
  final bool isRequired;
  final bool showRequiredSymbol;
  final Color borderColor;
  final String? suffix;
  final ValueChanged<String>? onChanged;
  final bool? isMultilined;
  final VoidCallback? onIconPressed;
  final Color? backgroundColor;

  final bool? isBorder;
  final bool isAutoFocus;
  const StTextField(
      {this.textController,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.isPassword = false,
      this.isNumber = false,
      this.isEmail = false,
      this.isRequired = false,
      this.isAutoFocus = true,
      this.showRequiredSymbol = false,
      this.borderColor = const Color.fromARGB(168, 224, 224, 224),
      this.suffix,
      this.onChanged,
      this.isMultilined = false,
      this.onIconPressed,
      this.backgroundColor,
      this.isBorder = false,
      super.key});

  @override
  State<StTextField> createState() => _StTextFieldState();
}

class _StTextFieldState extends State<StTextField> {
  bool _isTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return widget.isBorder == true
        ? _buildBorderTextField()
        : _buildNoBorderTextField(context);
  }

  Widget _buildBorderTextField() {
    return Container(
      color: const Color(0xFF05053F),
      margin: StyleConfig.commonHorizontalMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Padding(
              padding: StyleConfig.textFieldLabelPadding,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.labelText!,
                      style: StyleConfig.textFieldLabelStyle,
                    ),
                    if (widget.showRequiredSymbol)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          TextFormField(
            style: Theme.of(context).textTheme.titleLarge,
            controller: widget.textController,
            obscureText: widget.isPassword && _isTextVisible,
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : widget.isNumber
                    ? TextInputType.number
                    : TextInputType.text,
            onChanged: (text) {
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
            },
            cursorColor: ColorConfig.textColor,
            maxLines: widget.isMultilined! ? 4 : 1,
            decoration: InputDecoration(
              fillColor: widget.backgroundColor,
              filled: widget.backgroundColor != null ? true : false,
              enabledBorder: OutlineInputBorder(
                borderRadius: StyleConfig.textFieldBorderRadius,
                borderSide: BorderSide(color: widget.borderColor),
              ),
              border: OutlineInputBorder(
                borderRadius: StyleConfig.textFieldBorderRadius,
                borderSide: BorderSide(color: widget.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: StyleConfig.textFieldBorderRadius,
                borderSide: BorderSide(color: widget.borderColor),
              ),
              hintText: widget.hintText,
              suffix: widget.suffix != null ? Text(widget.suffix!) : null,
              suffixIcon: GestureDetector(
                onTap: () {
                  if (widget.isPassword) {
                    setState(() {
                      _isTextVisible = !_isTextVisible;
                    });
                  } else if (widget.onIconPressed != null) {
                    widget.onIconPressed!();
                  }
                },
                child: getSuffixIcon(),
              ),
            ),
            validator: (value) {
              print(value);
              if (widget.isRequired && value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNoBorderTextField(BuildContext context) {
    return Container(
      height: 60,
      margin: StyleConfig.commonHorizontalMargin,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF04153A),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        keyboardAppearance: Brightness.dark,
        autofocus: widget.isAutoFocus,
        onTap: () {},
        controller: widget.textController,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        cursorColor: ColorConfig.greycolor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 5),
          hintText: widget.hintText ?? "Enter input",
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
        ),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }

  getSuffixIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isPassword && widget.suffixIcon == null)
          FaIcon(
            _isTextVisible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
            color: ColorConfig.textColor,
            size: 18,
          ),
        if (widget.suffixIcon != null)
          Icon(
            widget.suffixIcon!,
            color: ColorConfig.textColor,
          ),
      ],
    );
  }
}
