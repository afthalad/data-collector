import 'package:flutter/material.dart';

class BePatientTextWidget extends StatelessWidget {
  const BePatientTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Note : Please be patient while loading. It may take some time to save properly.",
        style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.7),
      ),
    );
  }
}
