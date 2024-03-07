import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../../bloc/image/image_cubit.dart';
import '../../configs/styles/color_util.dart';
import '../../presentation/widgets/header_widget.dart';
import '../widgets/base widgets/st_button_widget.dart';
import '../../presentation/screens/upload_images_screen.dart';
import '../../presentation/widgets/base widgets/st_alert_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dvalue;
  final List<String> _list = ['Screw', 'Washer'];
  TextEditingController countController = TextEditingController();
  TextEditingController itemidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: ColorUtils.appBackgroundColor),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              promptWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget promptWidget() {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is ImageInitial ||
            state is ErrorState ||
            state is FirstSetImageCompleted) {
          itemidController.clear();
          countController.clear();
        }
      },
      builder: (context, state) {
        if (state is Dropdown ||
            state is ImageInitial ||
            state is ErrorState ||
            state is FirstSetImageCompleted) {
          return dropdownWidget();
        } else if (state is CountEntered) {
          return state.widget;
        } else if (state is ItemIdEntered) {
          return state.widget;
        }
        return const SizedBox();
      },
    );
  }

  Widget dropdownWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const STWarningAlertWidget(
          "Kindly, Please select the item type for futher saving process",
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "* What is the item type ?",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
              closedFillColor: Colors.transparent,
              closedBorder: Border.all(color: ColorUtils.buttonColors),
              closedSuffixIcon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.white,
              ),
              hintStyle: const TextStyle(
                color: Colors.blueGrey,
              ),
              headerStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
            ),
            hintText: 'Select item type',
            items: _list,
            onChanged: (value) {
              setState(() {
                dvalue = value;
              });
            },
          ),
        ),
        buttonWidget("dropdown"),
      ],
    );
  }

  // Widget itemIdWidget() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const STWarningAlertWidget(
  //         "Kindly, Please enter the item id for futher saving process",
  //       ),
  //       const Gap(10),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "* Please enter the ITEM ID before detect image ?",
  //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //                 fontWeight: FontWeight.normal,
  //                 color: Colors.white,
  //               ),
  //         ),
  //       ),
  //       const Gap(10),
  //       StTextField(
  //         hintText: "Enter item id ",
  //         textController: itemidController,
  //         isAutoFocus: false,
  //       ),
  //       const Gap(10),
  //       buttonWidget("itemid"),
  //       STButton(
  //         text: "Back",
  //         backgroundColor: Colors.transparent,
  //         onClick: () {
  //           context.read<ImageCubit>().backScreen("dropdown");
  //         },
  //       )
  //     ],
  //   );
  // }

  // Widget countWidget() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const STWarningAlertWidget(
  //           "Kindly, Please enter the count for futher proper saving process",
  //         ),
  //         const Gap(10),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             "* How many images you want to detect?",
  //             style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //                   fontWeight: FontWeight.normal,
  //                   color: Colors.white,
  //                 ),
  //           ),
  //         ),
  //         const Gap(10),this is
  //         StTextField(
  //           hintText: "Count 25 ",
  //           isNumber: true,
  //           isAutoFocus: false,
  //           textController: countController,
  //         ),
  //         const Gap(10),
  //         buttonWidget("count"),
  //         STButton(
  //           text: "Back",
  //           backgroundColor: Colors.transparent,
  //           onClick: () {
  //             context.read<ImageCubit>().backScreen("itemid");
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget buttonWidget(String status) {
    return STButton(
      onClick: () {
        if ((status == "itemid" && itemidController.text.isEmpty) ||
            (status == "count" && countController.text.isEmpty)) {
          return;
        }
        FocusManager.instance.primaryFocus?.unfocus();

        if (dvalue != null) {
          context.read<ImageCubit>().screen(
                status,
                countController.text,
                itemidController.text,
                dvalue == "Washer" ? true : false,
              );
        }

        if (status == "count" && countController.text != "") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadImagesScreen(
                itemId: itemidController.text,
                isScrew: dvalue == "Washer" ? true : false,
                count: int.parse(countController.text),
              ),
            ),
          );
        }
      },
    );
  }
}
