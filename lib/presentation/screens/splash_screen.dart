import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../configs/styles/color_util.dart';
import '../../core/utils/helpers/redirecter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Redirector().iniRedirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorUtils.appBackgroundColor,
        ),
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: SpinKitCircle(
            size: 64,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
