import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Welcome! AI-Powered Vision at Your Fingertips",
            style: GoogleFonts.blackOpsOne(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        const Gap(5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Upload your first set of image then second set for collect your images",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.7,
            ),
          ),
        ),
        const Divider(height: 30, thickness: 0.1),
      ],
    );
  }
}
