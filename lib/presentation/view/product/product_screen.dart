import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import 'widgets/buying_widget.dart';
import 'widgets/company_site_widget.dart';
import 'widgets/images_product_widget.dart';
import 'widgets/product_info_widget.dart';

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
                      text: "Type: ${product.type!}",
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
                /**
                 * show images for the product
                 */
                ProductImagesWidget(product: product),

                /**
                 * this wiget contains info and link refer to official store
                 * for the company
                 */
                const CompanySiteWidget(),
                /**
                 * widget which contains price op product
                 * and add to cart button
                 */
                BuyingWidget(product: product),
                const Divider(indent: 25, endIndent: 25, thickness: 2),

                /**
                 * widget which contains info about produuct 
                 * such as (overview, specification , review)
                 */
                ProductInfoWidget(product: product)
              ],
            ))
          ],
        ),
      ]),
    );
  }
}
