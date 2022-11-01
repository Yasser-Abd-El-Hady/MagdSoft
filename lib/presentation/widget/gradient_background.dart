import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LinearGradientBackground extends StatelessWidget {
  const LinearGradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.1.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 98, 189, 0.85),
          Color.fromRGBO(0, 98, 189, 0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}
