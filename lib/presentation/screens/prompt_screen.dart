// // ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
// import 'package:gap/gap.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../bloc/image/image_cubit.dart';
// import '../widgets/reset_button_widget.dart';
// import '../../configs/styles/color_util.dart';
// import '../widgets/base widgets/st_alert_widget.dart';
// import '../widgets/base widgets/st_button_widget.dart';
// import '../widgets/base widgets/st_textfield_widget.dart';
// import '../../presentation/screens/upload_images_screen.dart';

// class PromptScreen extends StatefulWidget {
//   const PromptScreen({Key? key}) : super(key: key);

//   @override
//   State<PromptScreen> createState() => _PromptScreenState();
// }

// class _PromptScreenState extends State<PromptScreen> {
//   TextEditingController itemidController = TextEditingController();
//   TextEditingController countController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: const BoxDecoration(gradient: ColorUtils.appBackgroundColor),
//       child: bodyWidget(),
//     );
//   }

//   Widget bodyWidget() {
//     return BlocConsumer<ImageCubit, ImageState>(
//       listener: (context, state) {
//         if (state is ItemIdEntered || state is ErrorState) {
//           itemidController.clear();
//           countController.clear();
//         } else {}
//       },
//       builder: (context, state) {
//         if (state is CountEntered) {
//           return itemIdAndCountInputWidget("count");
//         } else if (state is ImageInitial) {
//           return itemIdAndCountInputWidget("itemid");
//         }
//         return const Text("data");
//       },
//     );
//   }

//   Widget itemIdAndCountInputWidget(String status) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Gap(10),
//           STWarningAlertWidget(
//             status == "itemid"
//                 ? "Kindly, Please enter the item id for futher detection"
//                 : "Kindly, Please enter the count for futher detection",
//           ),
//           const Gap(10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               status == "itemid"
//                   ? "* Please enter the ITEM ID before detect image ?"
//                   : "* How many images you want to detect?",
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white,
//                   ),
//             ),
//           ),
//           const Gap(10),
//           status == "itemid"
//               ? StTextField(
//                   hintText: "Enter item id ",
//                   textController: itemidController,
//                   isAutoFocus: true,
//                 )
//               : StTextField(
//                   hintText: "Count 25 ",
//                   isNumber: true,
//                   isRequired: true,
//                   textController: countController,
//                 ),
//           const Gap(15),
//           buttonWidget(
//             status == "itemid"
//                 ? "itemid"
//                 : status == "count"
//                     ? "count"
//                     : "images",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buttonWidget(String status) {
//     return STButton(
//       onClick: () {
//         if (status == "count" && countController.text != "") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => UploadImagesScreen(
//                 itemId: itemidController.text,
//                 noImages: int.parse(countController.text),
//               ),
//             ),
//           );

//           return;
//         }
//         FocusManager.instance.primaryFocus?.unfocus();
//         context.read<ImageCubit>().screen(status);
//       },
//     );
//   }

//   Widget cameraImagesPlaceholders() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "* Please capture the top side of washers",
//             style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//           ),
//         ),
//         Expanded(
//           child: GridView.count(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             crossAxisCount: 3,
//             crossAxisSpacing: 4.0,
//             mainAxisSpacing: 8.0,
//             children: List.generate(
//               int.parse(countController.text),
//               (index) {
//                 return Container(
//                   color: Colors.amber,
//                   child: Center(
//                     child: Text(
//                       index.toString(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         ResetButton(
//           onClick: () {
//             // context.read<ImageCubit>().screen("init");
//             Navigator.pop(context);
//           },
//         )
//       ],
//     );
//   }
// }
