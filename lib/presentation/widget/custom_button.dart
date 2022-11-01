import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.text = "Button", this.buttonHeight, this.onPressed, Key? key})
      : super(key: key);
  final String text;
  final Function()? onPressed;
  final double? buttonHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 98, 189, 1),
              Color.fromRGBO(0, 98, 189, 0.7),
              Color.fromRGBO(0, 98, 189, 0.4)
            ],
          ),
        ),
        child: ElevatedButton(
          child: CustomText(
              text: text,
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: 17.sp),
          style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0),
          onPressed: onPressed,
        ));
  }
}
