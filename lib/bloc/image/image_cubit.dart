// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/image_repsitory.dart';
import '../../presentation/widgets/count_widget.dart';
import '../../core/utils/helpers/app_preferences.dart';
import '../../core/utils/helpers/id_prefs_helper.dart';
import '../../presentation/widgets/itemid_widget.dart';
import '../../presentation/widgets/loading_button.dart';
import '../../presentation/widgets/base widgets/st_alert_widget.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this.imageRepository) : super(ImageInitial());
  final ImageRepository imageRepository;

  Future<void> requester(
    List<String> imageFileList,
    String itemid,
    String view,
  ) async {
    print("object");
    print(view);
    emit(LoadingState());
    String userId = IdSaver.idSaver();
    FormData formData = FormData();

    formData = FormData.fromMap({
      'images': [...imageFileList],
      'user_id': userId,
      'image_type': view,
      'item_id': itemid,
    });

    try {
      final response = await imageRepository.requester(formData);
      final responseStatusCode = response.statusCode;
      var data = response.data;
      print(response);

      if (responseStatusCode == 200 && data['status'] == "saved") {
        if (view == "top_view" || view == "face_two") {
          emit(FirstSetImageCompleted(imageFileList.length, view));
          Future.delayed(const Duration(seconds: 1));
          emit(ImageInitial());
          return;
        }
        emit(FirstSetImageCompleted(imageFileList.length, view));
      }
    } catch (e) {
      emit(ErrorState());
      Future.delayed(const Duration(seconds: 1));
      emit(ImageInitial());
    }
  }

  Future<void> againRequester(
    List<String> imageFileList,
    String itemid,
    String view,
  ) async {
    int runCount = 0;

    do {
      print("again");
      print("object");
      print(runCount == 1 ? "face_two" : view);

      print("before : $runCount");
      emit(LoadingState());
      String userId = IdSaver.idSaver();
      FormData formData = FormData();
      final String viewStatus = runCount == 1 ? "face_two" : view;
      formData = FormData.fromMap({
        'images': [...imageFileList],
        'user_id': userId,
        'image_type': viewStatus,
        'item_id': itemid,
      });

      // for (var image in imageFileList) {
      //   formData.files.add(MapEntry(
      //     'images',
      //     await MultipartFile.fromFile(image.path),
      //   ));
      // }

      // formData.fields.addAll({
      //   'user_id': userId,
      //   'image_type': viewStatus,
      //   'item_id': itemid,
      // }.entries);

      try {
        final response = await imageRepository.requester(formData);
        final responseStatusCode = response.statusCode;
        var data = response.data;
        print(response);

        if (responseStatusCode == 200 && data['status'] == "saved") {
          if (runCount == 1) {
            emit(FirstSetImageCompleted(imageFileList.length, viewStatus));
          }
          print("after : $runCount");

          runCount++;
        }
      } catch (e) {
        emit(ErrorState());
        Future.delayed(const Duration(seconds: 1));
        emit(ImageInitial());
      }
    } while (runCount < 2);
  }

  reset(view) async {
    emit(LoadingState());
    var existId = AppPreferences.getString("id");

    FormData formData = FormData.fromMap({
      'user_id': existId,
      'image_type': view,
    });

    final response = await imageRepository.reset(formData);
    final responseStatusCode = response.statusCode;
    var data = response.data;
    print(response);
    if (responseStatusCode == 200 && data['status'] == "deleted") {
      emit(ImageInitial());
    }
  }

  screen(state, count, itemid, isScrew) {
    switch (state) {
      case "count":
        emit(CountEntered(count, isScrew, itemid));
        break;
      case "itemid":
        emit(CountEntered(count, isScrew, itemid));
        break;

      case "dropdown":
        emit(ItemIdEntered(isScrew));
        break;

      case "init":
        emit(ImageInitial());
        break;
      default:
    }
  }

  backScreen(
    state,
  ) {
    print("screen bloc");
    print(state);

    switch (state) {
      case "itemid":
        emit(ItemIdEntered(false));
        break;

      case "dropdown":
        emit(Dropdown());
        break;

      default:
    }
  }
}
