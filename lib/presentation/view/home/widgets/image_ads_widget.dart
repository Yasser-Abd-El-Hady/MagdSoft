import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class ImageAdsWidget extends StatelessWidget {
  const ImageAdsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.8.w,
      height: 18.9.h,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/home_ads.png", fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: CustomText(
                text: "New Release\nAcer Predator Helios 300",
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 6.sp,
                color: AppColor.white),
          ),
        )
      ]),
    );
  }
}
