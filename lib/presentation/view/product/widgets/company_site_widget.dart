import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class CompanySiteWidget extends StatelessWidget {
  const CompanySiteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: 10.h,
        padding: EdgeInsets.only(
            top: 0.86.h, bottom: 0.86.h, left: 2.1.w, right: 4.w),
        margin: EdgeInsets.only(left: 2.3.w, bottom: 3.8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: 9.7.h,
                  color: (const Color.fromARGB(228, 247, 245, 245)),
                  blurRadius: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/acer_logo.png",
                          fit: BoxFit.contain)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: "Acer Official Store",
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: AppColor.customGrey),
                        CustomText(
                            text: "View Store",
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColor.lightGrey)
                      ]),
                ),
              ],
            ),
            CustomContainer(
                width: 11.6.w,
                height: 5.4.h,
                child: const Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColor.lightGrey)),
          ],
        ));
  }
}
