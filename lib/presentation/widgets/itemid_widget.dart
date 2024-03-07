// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/image/image_cubit.dart';
import '../../presentation/widgets/base widgets/st_alert_widget.dart';
import '../../presentation/widgets/base widgets/st_button_widget.dart';
import '../../presentation/widgets/base widgets/st_textfield_widget.dart';

class ItemIdWidget extends StatefulWidget {
  const ItemIdWidget({
    Key? key,
    required this.isScrew,
  }) : super(key: key);
  final bool isScrew;
  @override
  State<ItemIdWidget> createState() => _ItemIdWidgetState();
}

class _ItemIdWidgetState extends State<ItemIdWidget> {
  TextEditingController itemidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const STWarningAlertWidget(
          "Kindly, Please enter the item id for futher saving process",
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "* Please enter the ITEM ID before detect image ?",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
          ),
        ),
        const Gap(10),
        StTextField(
          hintText: "Enter item id ",
          textController: itemidController,
          isAutoFocus: false,
        ),
        const Gap(10),
        STButton(
          onClick: () {
            context.read<ImageCubit>().screen(
                  "itemid",
                  0,
                  itemidController.text,
                  widget.isScrew,
                );
          },
        ),
        STButton(
          text: "Back",
          backgroundColor: Colors.transparent,
          onClick: () {
            context.read<ImageCubit>().backScreen("dropdown");
          },
        )
      ],
    );
  }
}
