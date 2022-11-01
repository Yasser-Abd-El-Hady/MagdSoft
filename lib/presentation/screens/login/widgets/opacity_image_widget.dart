import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OpacityImageWidget extends StatelessWidget {
  const OpacityImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 41.4.h,
          child: Image.asset(
            "assets/images/login.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          )),
      Opacity(
        opacity: 0.9,
        child: SizedBox(
          height: 41.4.h,
          child: Image.asset(
            "assets/images/opacity.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ]);
  }
}
