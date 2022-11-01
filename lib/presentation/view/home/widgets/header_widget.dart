import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:sizer/sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 5.4.h, bottom: 2.4.h, left: 4.7.w, right: 4.7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
              width: 75.3.w,
              height: 5.4.h,
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        TextStyle(color: AppColor.lightGrey, fontSize: 14.sp),
                    suffixIcon:
                        const Icon(Icons.search, color: AppColor.lightGrey),
                    border: InputBorder.none,
                  ),
                ),
              )),
          CustomContainer(
              width: 11.6.w,
              height: 5.4.h,
              child: const Icon(Icons.filter_alt, color: AppColor.lightGrey))
        ],
      ),
    );
  }
}
