import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_circle_avatar.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class CurvedWidget extends StatelessWidget {
  const CurvedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 33.9.h),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            color: AppColor.white),
        child: Padding(
            padding: EdgeInsets.only(top: 38.4.h, left: 6.7.w, right: 6.7.w),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                        child:
                            Divider(thickness: 1.2, color: AppColor.secondary)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CustomText(
                          text: "OR",
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: AppColor.secondary),
                    ),
                    Expanded(
                        child:
                            Divider(thickness: 1.2, color: AppColor.secondary)),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 9.3.h, left: 15.1.w, right: 15.1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomCircleAvatar(image: "facebook.png"),
                      CustomCircleAvatar(image: "apple.png"),
                      CustomCircleAvatar(image: "google.png"),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
