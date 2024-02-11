import 'package:flutter/material.dart';

class STWarningAlertWidget extends StatelessWidget {
  final String alert;
  const STWarningAlertWidget(
    this.alert, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow.shade100,
      ),
      child: Text(
        alert,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
