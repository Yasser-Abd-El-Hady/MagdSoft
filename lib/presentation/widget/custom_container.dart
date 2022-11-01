import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {this.width,
      this.height,
      this.margin,
      this.padding,
      this.borderRadius = 10,
      this.blurRadius = 10,
      this.spreadRadius = 1,
      this.color = AppColor.white,
      this.child,
      Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final Color color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: color,
          boxShadow: [
            BoxShadow(
                blurRadius: blurRadius,
                color: AppColor.grey,
                spreadRadius: spreadRadius)
          ],
        ),
        child: child);
  }
}
