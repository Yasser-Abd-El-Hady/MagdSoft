import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {required this.image,
      this.imageWidth,
      this.imageHieght,
      this.radius = 25.0,
      this.blurRadius = 10,
      this.spreadRadius = 5,
      Key? key})
      : super(key: key);

  final String image;
  final double radius;
  final double blurRadius;
  final double spreadRadius;
  final double? imageWidth;
  final double? imageHieght;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: blurRadius,
              color: AppColor.grey,
              spreadRadius: spreadRadius)
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColor.white,
        child: Image.asset("assets/images/$image",
            width: imageWidth, height: imageHieght),
      ),
    );
  }
}
