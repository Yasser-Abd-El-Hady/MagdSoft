import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_form_field.dart';
import 'package:sizer/sizer.dart';

class VerifyAccountWidget extends StatelessWidget {
  const VerifyAccountWidget({
    Key? key,
    required TextEditingController first,
    required TextEditingController second,
    required TextEditingController third,
    required TextEditingController fourth,
  })  : _first = first,
        _second = second,
        _third = third,
        _fourth = fourth,
        super(key: key);

  final TextEditingController _first;
  final TextEditingController _second;
  final TextEditingController _third;
  final TextEditingController _fourth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 14.8.h, bottom: 10.9.h, left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
            width: 16.3.w,
            height: 8.6.h,
            borderRadius: 15,
            child: CustomTextFormField(
                controller: _first,
                fontSize: 40,
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                textColor: AppColor.primary),
          ),
          CustomContainer(
            width: 16.3.w,
            height: 8.6.h,
            borderRadius: 15,
            child: CustomTextFormField(
                controller: _second,
                fontSize: 40,
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                textColor: AppColor.primary),
          ),
          CustomContainer(
            width: 16.3.w,
            height: 8.6.h,
            borderRadius: 15,
            child: CustomTextFormField(
                controller: _third,
                fontSize: 40,
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                textColor: AppColor.primary),
          ),
          CustomContainer(
            width: 16.3.w,
            height: 8.6.h,
            borderRadius: 15,
            child: CustomTextFormField(
                controller: _fourth,
                fontSize: 40,
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                textColor: AppColor.primary),
          ),
        ],
      ),
    );
  }
}
