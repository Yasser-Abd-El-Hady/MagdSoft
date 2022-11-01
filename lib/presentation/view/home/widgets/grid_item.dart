import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/custom_container.dart';
import '../../../widget/custom_text.dart';

class GridItem extends StatefulWidget {
  const GridItem({required this.product, Key? key}) : super(key: key);
  final ProductModel product;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 32.h,
      margin: EdgeInsets.only(bottom: 2.1.h, left: 3.5.w, right: 3.5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            CustomContainer(
              width: double.infinity,
              height: 19.h,
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                    "assets/images/product${widget.product.id}.png",
                    fit: BoxFit.contain),
                // Image.network(widget.product.image!, fit: BoxFit.contain),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 3, right: 5),
                child: InkWell(
                  onTap: () {
                    check = !check;
                    setState(() {});
                  },
                  child: Icon(
                    check ? Icons.favorite_border : Icons.favorite,
                    color: AppColor.red,
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(
              top: 0.5.h,
              left: 2.3.w,
            ),
            child: CustomText(
                text: widget.product.company!,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: AppColor.primary,
                fontSize: 15.sp),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0.4.h,
              left: 2.3.w,
            ),
            child: CustomText(
                text: widget.product.name!,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: AppColor.customGrey,
                fontSize: 10.sp),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.3.w, bottom: 0.6.h),
                    child: CustomText(
                        text: "${widget.product.price} EGP",
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        color: AppColor.customGrey,
                        fontSize: 9.sp),
                  ),
                  Container(
                    width: 10.w,
                    height: 3.5.h,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(0, 98, 189, 1),
                        Color.fromRGBO(0, 98, 189, 0)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: CustomText(
                      text: "+",
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      color: AppColor.white,
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
