// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

part of 'image_cubit.dart';

enum ImageType { screwHead, screwBody, washerF1, washerF2 }

@immutable
sealed class ImageState {}

class CountEntered extends ImageState {
  var imgCount;
  var itemid;
  bool isScrew;
  late CountWidget widget;

  CountEntered(this.imgCount, this.isScrew, this.itemid) {
    widget = CountWidget(
      isScrew: isScrew,
      itemid: itemid,
    );
  }
}

class LoadingState extends ImageState {
  final Widget loadingButton = const LoadingButton();
  final Widget loadingAlertWidget =
      const STWarningAlertWidget("We are processing you image...\n");
}

class ItemIdEntered extends ImageState {
  bool isScrew;
  late ItemIdWidget widget;

  ItemIdEntered(this.isScrew) {
    widget = ItemIdWidget(
      isScrew: isScrew,
    );
  }
}

final class Dropdown extends ImageState {}

final class ErrorState extends ImageState {
  final Widget widget = Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red.shade100,
    ),
    child: const Text(
      "Something went wrong with our end, Please try again",
      style: TextStyle(
        fontSize: 15,
        color: Colors.black38,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

final class ImageInitial extends ImageState {
  final Widget widget = Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.yellow.shade100),
    child: const Text(
      "Kindly, Please upload an image to be used for the detection process",
      style: TextStyle(
        fontSize: 15,
        color: Colors.black38,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

final class FirstSetImageCompleted extends ImageState {
  final int imgCount;
  final String status;
  final Widget screwheadAlertwidget = const STWarningAlertWidget(
    "Please capture the head of screw for further detection",
  );
  FirstSetImageCompleted(this.imgCount, this.status);
}

final class Success extends ImageState {}
