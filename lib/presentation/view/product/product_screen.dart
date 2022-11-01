import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const LinearGradientBackground(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.4.h, left: 5.3.w, right: 7.7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                      width: 11.6.w,
                      height: 5.4.h,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: AppColor.lightGrey),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 1.7.h, bottom: 0.5.h),
                      child: CustomText(
                          text: product.name!,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: AppColor.white)),
                  CustomText(
                      text: product.type!,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColor.white)
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(left: 5.3.w, right: 7.7.w),
              children: [
                CustomContainer(
                    height: 25.h,
                    padding: const EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 1.7.h, left: 2.3.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/1.png",
                            fit: BoxFit.contain))),
                SizedBox(
                  height: 17.2.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomContainer(
                                    width: 30.w,
                                    height: 9.h,
                                    padding: const EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                        top: 3.1.h, bottom: 3.1.h, left: 5.3.w),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                            "assets/images/1.png",
                                            fit: BoxFit.contain)));
                              }))
                    ],
                  ),
                ),
                CustomContainer(
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
                                  child: Image.asset(
                                      "assets/images/acer_logo.png",
                                      fit: BoxFit.contain)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 2.3.w, bottom: 1.6.h),
                    child: SizedBox(
                      height: 6.h,
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
                                    fontSize: 13.sp,
                                    color: AppColor.lightGrey),
                                CustomText(
                                    text: "${product.price} EGP",
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: AppColor.customGrey)
                              ]),
                          Container(
                              width: 41.9.w,
                              height: double.infinity,
                              decoration: ShapeDecoration.fromBoxDecoration(
                                  BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(0, 98, 189, 1),
                                      Color.fromRGBO(0, 98, 189, 0.3)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              )),
                              child: ElevatedButton(
                                child: CustomText(
                                    text: "Add To Cart",
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp),
                                style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    primary: Colors.transparent,
                                    elevation: 0),
                                onPressed: () {},
                              ))
                        ],
                      ),
                    )),
                const Divider(indent: 25, endIndent: 25, thickness: 2),
                Padding(
                  padding: EdgeInsets.only(top: 1.6.h, left: 2.3.w),
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
                      top: 1.6.h, bottom: 1.1.h, left: 2.4.w, right: 0.70.w),
                  child: CustomText(
                    text: product.description!,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: AppColor.lightGrey,
                  ),
                )
              ],
            ))
          ],
        ),
      ]),
    );
  }
}
