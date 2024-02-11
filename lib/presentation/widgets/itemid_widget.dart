import 'package:data_collector/presentation/widgets/base%20widgets/st_alert_widget.dart';
import 'package:data_collector/presentation/widgets/base%20widgets/st_button_widget.dart';
import 'package:data_collector/presentation/widgets/base%20widgets/st_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/image/image_cubit.dart';

class ItemIdWidget extends StatefulWidget {
  const ItemIdWidget({super.key});

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
            context
                .read<ImageCubit>()
                .screen("itemid", 0, itemidController.text, false);
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