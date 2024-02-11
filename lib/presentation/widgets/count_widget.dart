import 'package:data_collector/presentation/widgets/base widgets/st_alert_widget.dart';
import 'package:data_collector/presentation/widgets/base widgets/st_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/image/image_cubit.dart';
import '../screens/upload_images_screen.dart';
import 'base widgets/st_textfield_widget.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({super.key, this.itemid, this.isScrew});
  final itemid;
  final isScrew;
  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const STWarningAlertWidget(
            "Kindly, Please enter the count for futher proper saving process",
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "* How many images you want to detect?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
            ),
          ),
          const Gap(10),
          StTextField(
            hintText: "Count 25 ",
            isNumber: true,
            isAutoFocus: false,
            textController: countController,
          ),
          const Gap(10),
          buttonWidget("count"),
          STButton(
            text: "Back",
            backgroundColor: Colors.transparent,
            onClick: () {
              context.read<ImageCubit>().backScreen("itemid");
            },
          )
        ],
      ),
    );
  }

  Widget buttonWidget(String status) {
    return STButton(
      onClick: () {
        if (countController.text.isEmpty) {
          return;
        }
        FocusManager.instance.primaryFocus?.unfocus();

        if (status == "count" && countController.text != "") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadImagesScreen(
                itemId: widget.itemid,
                isScrew: widget.isScrew == "Washer" ? true : false,
                count: int.parse(countController.text),
              ),
            ),
          );
        }
      },
    );
  }
}
