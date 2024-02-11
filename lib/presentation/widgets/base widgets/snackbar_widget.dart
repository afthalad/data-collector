import 'package:flutter/material.dart';

class SnackbarShow {
  final BuildContext context;

  SnackbarShow(this.context);
  void showSnackbar(isSuccess) {
    var snackBar = SnackBar(
      backgroundColor: isSuccess == true ? Colors.green : Colors.red,
      content: Text(
        isSuccess == true
            ? 'Successfully saved your images'
            : 'Something went wrong',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pop(context);
  }
}
