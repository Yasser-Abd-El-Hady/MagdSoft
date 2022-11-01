import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.1.h, left: 2.3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                      text: "Overview",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.customGrey),
                  CustomText(
                      text: "•",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.primary),
                ],
              ),
              Column(
                children: [
                  CustomText(
                      text: "Spesification",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.lightGrey),
                  CustomText(
                      text: "•",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.white),
                ],
              ),
              Column(
                children: [
                  CustomText(
                      text: "Review",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.lightGrey),
                  CustomText(
                      text: "•",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.white),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 1.1.h, bottom: 1.1.h, left: 2.4.w, right: 0.70.w),
          child: CustomText(
            text: product.description!,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            color: AppColor.lightGrey,
          ),
        ),
      ],
    );
  }
}
