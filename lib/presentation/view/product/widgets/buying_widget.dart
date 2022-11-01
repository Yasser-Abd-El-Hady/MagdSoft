import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class BuyingWidget extends StatelessWidget {
  const BuyingWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.3.w, bottom: 1.4.h),
        child: SizedBox(
          height: 6.4.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: "Price",
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColor.lightGrey),
                    CustomText(
                        text: "${product.price} EGP",
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: AppColor.customGrey)
                  ]),
              Container(
                  width: 41.9.w,
                  height: double.infinity,
                  decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(0, 98, 189, 1),
                      Color.fromRGBO(0, 98, 189, 0.3)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  )),
                  child: ElevatedButton(
                    child: CustomText(
                        text: "Add To Cart",
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp),
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: Colors.transparent,
                        elevation: 0),
                    onPressed: () {},
                  ))
            ],
          ),
        ));
  }
}
