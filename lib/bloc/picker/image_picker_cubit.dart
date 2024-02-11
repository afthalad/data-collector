// // ignore_for_file: avoid_print

// import 'dart:io';
// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:image_picker/image_picker.dart';

// part 'image_picker_state.dart';

// class ImageCubit extends Cubit<ImagePickerState> {
//   final ImagePicker _picker = ImagePicker();

//   final List<XFile> _headImageList = [];
//   final List<String> _headBase64Images = [];

//   final List<XFile> _bodyImageList = [];
//   final List<String> _bodyBase64Images = [];

//   final List<XFile> _faceOneImageList = [];
//   final List<String> _faceOneBase64Images = [];

//   final List<XFile> _faceTwoImageList = [];
//   final List<String> _faceTwoBase64Images = [];

//   ImageCubit() : super(ImagePickerInitial());

//   List<String> get headBase64Images => _headBase64Images;
//   List<String> get bodyBase64Images => _bodyBase64Images;
//   List<String> get faceOneBase64Images => _faceOneBase64Images;
//   List<String> get faceTwoBase64Images => _faceTwoBase64Images;
//   List<XFile> get headImageList => _headImageList;
//   List<XFile> get bodyImageList => _bodyImageList;
//   List<XFile> get faceOneImageList => _faceOneImageList;
//   List<XFile> get faceTwoImageList => _faceTwoImageList;

//   void pickImage(ImageType type, isCamera) async {
//     print("object");
//     print(type);
//     emit(ImagePickingInProgress(type));
//     try {
//       final XFile? image = await _picker.pickImage(
//         source: isCamera == true ? ImageSource.camera : ImageSource.gallery,
//       );
//       if (image == null) return;
//       File imageFile = File(image.path);
//       List<int> imageBytes = await imageFile.readAsBytes();
//       String base64String = base64Encode(imageBytes);

//       switch (type) {
//         case ImageType.screwHead:
//           _headImageList.add(image);
//           _headBase64Images.add(base64String);
//           break;
//         case ImageType.screwBody:
//           _bodyImageList.add(image);
//           _bodyBase64Images.add(base64String);
//         case ImageType.washerF1:
//           _faceOneImageList.add(image);
//           _faceOneBase64Images.add(base64String);
//         case ImageType.washerF2:
//           _faceTwoImageList.add(image);
//           _faceTwoBase64Images.add(base64String);
//           break;
//       }

//       List<String> images;
//       switch (type) {
//         case ImageType.screwBody:
//           images = _bodyBase64Images;
//           print(type);
//           break;
//         case ImageType.screwHead:
//           images = _headBase64Images;
//           print(images);
//           print(type);
//           break;
//         case ImageType.washerF1:
//           images = faceOneBase64Images;
//           print(images);
//           print(type);
//           break;
//         case ImageType.washerF2:
//           images = faceTwoBase64Images;
//           print(images);
//           print(type);
//           break;
//         default:
//           images = _bodyBase64Images;
//           print(images);
//           print(type);
//       }
//       emit(ImagePickedSuccess(type, images));
//     } catch (e) {
//       emit(
//         ImagePickedFailure(
//           type,
//           e.toString(),
//         ),
//       );
//     }
//   }

//   void removeImage(ImageType type, int index) {
//     switch (type) {
//       case ImageType.screwHead:
//         _headImageList.removeAt(index);
//         _headBase64Images.removeAt(index);
//         break;
//       case ImageType.screwBody:
//         _bodyImageList.removeAt(index);
//         _bodyBase64Images.removeAt(index);
//         break;
//       case ImageType.washerF1:
//         _faceOneImageList.removeAt(index);
//         _faceOneBase64Images.removeAt(index);
//       case ImageType.washerF2:
//         _faceTwoImageList.removeAt(index);
//         _faceTwoBase64Images.removeAt(index);
//     }
//   }

//   void clearAllImage() {
//     _headImageList.clear();
//     _headBase64Images.clear();
//     _bodyImageList.clear();
//     _bodyBase64Images.clear();
//     _faceOneImageList.clear();
//     _faceOneBase64Images.clear();
//     _faceTwoImageList.clear();
//     _faceTwoBase64Images.clear();
//   }
// }
