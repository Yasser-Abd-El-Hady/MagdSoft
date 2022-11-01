import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../widget/custom_circle_avatar.dart';
import '../../../widget/custom_container.dart';
import '../../../widget/custom_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {required this.itemName,
      required this.selectedItem,
      required this.onTap,
      Key? key})
      : super(key: key);

  final String itemName;
  final String selectedItem;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double widgetWidth;
    bool check = itemName.toLowerCase() == selectedItem;
    if (itemName == "All") {
      widgetWidth = 30.7.w;
    } else if (itemName == "Acer") {
      widgetWidth = 36.5.w;
    } else {
      widgetWidth = 38.9.w;
    }
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
          width: widgetWidth,
          height: 6.h,
          margin: EdgeInsets.only(top: 1.5.h, bottom: 3.2.h, left: 4.7.w),
          borderRadius: 30,
          blurRadius: 10,
          spreadRadius: 0,
          color: check ? AppColor.primary : AppColor.white,
          child: Row(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: CustomCircleAvatar(
                  image: "${itemName.toLowerCase()}.png",
                  radius: 18,
                  blurRadius: check ? 0 : 10,
                  spreadRadius: check ? 0 : 5,
                  imageWidth: 25,
                  imageHieght: 25),
            ),
            CustomText(
                text: itemName,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: check ? AppColor.white : null)
          ])),
    );
  }
}
