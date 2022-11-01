import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    String screen;
    if (CacheHelper.getDataFromSharedPreference(key: "id") != null) {
      screen = helpScreen;
    } else {
      screen = loginScreen;
    }
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.popAndPushNamed(context, screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.primary,
        child: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 8.1.h),
              child: Image.asset("assets/images/lrectangle.png",
                  width: 45.w, height: 33.h),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 19.h),
              child: Image.asset("assets/images/rcrescent.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 21.h),
              child: Image.asset("assets/images/lcrescent.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Image.asset("assets/images/rrectangle.png",
                  width: 45.w, height: 33.h),
            ),
          ),
          Center(
              child: Image.asset("assets/images/bird.png",
                  width: 63.w, height: 22.h)),
        ]),
      ),
    );
  }
}
//430    932