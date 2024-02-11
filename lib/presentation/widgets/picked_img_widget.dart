// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../configs/styles/color_util.dart';

class PickedImagesWidget extends StatelessWidget {
  const PickedImagesWidget({
    Key? key,
    required this.base64Images,
  }) : super(key: key);

  final List<String> base64Images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: base64Images.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.buttonColors),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.memory(base64Decode(base64Images[index])),
                Positioned(
                  top: 5,
                  right: 5,
                  child: InkWell(
                    onTap: () {},
                    // context.read<ImageCubit>().removeImage(
                    //       isBody
                    //           ? ImageType.screwBody
                    //           : ImageType.screwHead,
                    //       index,
                    //     ),
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
