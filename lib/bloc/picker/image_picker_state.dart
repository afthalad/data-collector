// part of 'image_picker_cubit.dart';

// enum ImageType { screwHead, screwBody, washerF1, washerF2 }

// abstract class ImagePickerState {
//   List<Object?> get props => [];
// }

// class ImagePickerInitial extends ImagePickerState {}

// class ImagePickingInProgress extends ImagePickerState {
//   final ImageType type;

//   ImagePickingInProgress(this.type);

//   @override
//   List<Object?> get props => [type];
// }

// class ImagePickedSuccess extends ImagePickerState {
//   final ImageType type;

//   final List<String> base64String;

//   ImagePickedSuccess(this.type, this.base64String);

//   @override
//   List<Object?> get props => [type, base64String];
// }

// class ImagePickedFailure extends ImagePickerState {
//   final ImageType type;
//   final String errorMessage;

//   ImagePickedFailure(this.type, this.errorMessage);

//   @override
//   List<Object?> get props => [type, errorMessage];
// }

// class ImageRemoved extends ImagePickerState {
//   final ImageType type;

//   ImageRemoved(this.type);

//   @override
//   List<Object?> get props => [type];
// }
