// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import '../../configs/styles/color_util.dart';

class ImagePickerPlaceholderWidget extends StatefulWidget {
  const ImagePickerPlaceholderWidget(
      {Key? key, this.ontap, this.remainingCount})
      : super(key: key);

  final Function()? ontap;
  final int? remainingCount;

  @override
  State<ImagePickerPlaceholderWidget> createState() =>
      _ImagePickerPlaceholderWidgetState();
}

class _ImagePickerPlaceholderWidgetState
    extends State<ImagePickerPlaceholderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.ontap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: ColorUtils.transparentColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.2,
              color: const Color.fromARGB(255, 62, 14, 110),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_a_photo,
                color: Colors.grey,
                size: 30,
              ),
              const Gap(10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Please insert ${widget.remainingCount} more images",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
