// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:io';
import 'dart:convert';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/configs/routes.dart';
import '../../bloc/image/image_cubit.dart';
import '../widgets/reset_button_widget.dart';
import '../../configs/styles/color_util.dart';
import '../widgets/base widgets/snackbar_widget.dart';
import '../widgets/base widgets/st_alert_widget.dart';
import '../widgets/base widgets/st_patient_text_widget.dart';
import '../../presentation/widgets/base widgets/st_button_widget.dart';

class UploadImagesScreen extends StatefulWidget {
  const UploadImagesScreen({
    Key? key,
    required this.itemId,
    required this.isScrew,
    required this.count,
  }) : super(key: key);

  final String itemId;
  final bool isScrew;
  final int count;
  @override
  State<UploadImagesScreen> createState() => _UploadImagesScreenState();
}

class _UploadImagesScreenState extends State<UploadImagesScreen> {
  bool isChecked = false;
  bool isAllImages = false;
  final List<String> _base64Images = [];
  final ImagePicker _picker = ImagePicker();
  final List<File> _imageFiles = [];

  Future<void> pickImage(bool isCamera) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (image == null) return;
      Directory tempDir = await getTemporaryDirectory();
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
      File imageFile = File('${tempDir.path}/$fileName');
      await imageFile.writeAsBytes(await image.readAsBytes());

      File imageFileB64 = File(image.path);
      List<int> imageBytes = await imageFileB64.readAsBytes();
      String imgBase64 = base64Encode(imageBytes);
      setState(() {
        _imageFiles.add(imageFile);
        _base64Images.add(imgBase64);
      });
    } catch (e) {
      throw ("SOmething wrong with capture image");
    }
  }

  void deleteImage(int index) {
    setState(() {
      _imageFiles[index].deleteSync();
      _imageFiles.removeAt(index);
      _base64Images.removeAt(index);
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  pickImage(true);
                  Navigator.of(context).pop();
                },
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickImage(false);
                  Navigator.of(context).pop();
                },
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration:
            const BoxDecoration(gradient: ColorUtils.appBackgroundColor),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                alertsWidget(),
                const Gap(20),
                checkBoxWidget(widget.isScrew),
                const Gap(10),
                imagePickerWidget(),
                pickedImagesWidget(),
                const Gap(15),
                buttonWidget(),
                const Gap(10),
                resetbuttonWidget(),
                const BePatientTextWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkBoxWidget(bool isScrew) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is FirstSetImageCompleted && state.status == "face_one") {
          return const SizedBox();
        }

        if (isScrew) {
          return Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Copy face one as face two images.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget alertsWidget() {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is FirstSetImageCompleted) {
          if (widget.isScrew) {
            return const STWarningAlertWidget(
              "Please capture the face two of washer for further detection",
            );
          }
          return state.screwheadAlertwidget;
        } else if (state is LoadingState) {
          return state.loadingAlertWidget;
        }

        if (widget.isScrew) {
          return const STWarningAlertWidget(
            "Please capture the face one of washer for further detection",
          );
        }
        return const STWarningAlertWidget(
          "Please capture the body of screw for further detection",
        );
      },
    );
  }

  Widget imagePickerWidget() {
    if (widget.count == _base64Images.length) {
      return const SizedBox();
    }
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is FirstSetImageCompleted ||
            state is CountEntered ||
            state is LoadingState) {
          return InkWell(
            onTap: () {
              _showBottomSheet();
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
                        "Please insert ${widget.count - _base64Images.length} more images",
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
        return Text(
          state.toString(),
          style: const TextStyle(color: Colors.amber),
        );
      },
    );
  }

  Widget pickedImagesWidget() {
    return Column(
      children: [
        BlocConsumer<ImageCubit, ImageState>(
          listener: (context, state) {
            if (state is FirstSetImageCompleted) {
              final String stateStatus = state.status;
              setState(() {
                _base64Images.clear();
              });

              if (stateStatus == "top_view" || stateStatus == "face_two") {
                Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
              }
            }
          },
          builder: (context, state) {
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
                itemCount: _base64Images.length,
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
                        Image.file(_imageFiles[index]),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: InkWell(
                            onTap: () {
                              deleteImage(index);
                            },
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
          },
        ),
      ],
    );
  }

  Widget buttonWidget() {
    var readCubit = context.read<ImageCubit>();

    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is FirstSetImageCompleted) {
          final String stateStatus = state.status;
          if (stateStatus == "top_view" || stateStatus == "face_two") {
            SnackbarShow(context).showSnackbar(true);
          }
        } else if (state is ErrorState) {
          SnackbarShow(context).showSnackbar(false);
        }
      },
      builder: (context, state) {
        print(state);
        if (state is FirstSetImageCompleted) {
          final String stateStatus = state.status;

          if (stateStatus == "side_view") {
            return STButton(onClick: () {
              readCubit.requester(_base64Images, widget.itemId, 'top_view');
            });
          } else if (stateStatus == "face_one") {
            return STButton(
              onClick: () {
                readCubit.requester(_base64Images, widget.itemId, 'face_two');
              },
            );
          }
          return Text(
            state.status,
            style: const TextStyle(color: Colors.amber),
          );
        } else if (state is CountEntered || state is ImageInitial) {
          if (widget.isScrew) {
            return STButton(
              onClick: () {
                print("props");
                print(widget.isScrew);
                print(isChecked);
                isChecked
                    ? readCubit.requester(
                        _base64Images, widget.itemId, 'face_one')
                    : readCubit.requester(
                        _base64Images, widget.itemId, 'face_one');
              },
            );
          } else {
            return STButton(
              onClick: () {
                readCubit.requester(_base64Images, widget.itemId, 'side_view');
              },
            );
          }
        } else if (state is LoadingState) {
          return state.loadingButton;
        }
        return STButton();
        // return STButton(onClick: () {
        //   readCubit.requester(_base64Images, "asdas", 'side_view');
        // });
      },
    );
  }

  Widget resetbuttonWidget() {
    return _base64Images.isEmpty
        ? const SizedBox()
        : BlocConsumer<ImageCubit, ImageState>(
            listener: (context, state) {
              if (state is ImageInitial) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is FirstSetImageCompleted) {
                final String stateStatus = state.status;
                if (stateStatus == "side_view") {
                  return ResetButton(
                    onClick: () {
                      context.read<ImageCubit>().reset("side_view");
                    },
                  );
                } else if (stateStatus == "face_one") {
                  return ResetButton(
                    onClick: () {
                      context.read<ImageCubit>().reset("face_one");
                    },
                  );
                }
              }
              return ResetButton(
                onClick: () {
                  context.read<ImageCubit>().screen("init", 0, false, "");
                },
              );
            },
          );
  }
}
