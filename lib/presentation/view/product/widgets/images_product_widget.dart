import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:sizer/sizer.dart';

class ProductImagesWidget extends StatelessWidget {
  const ProductImagesWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CustomContainer(
          height: 25.h,
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 1.7.h, left: 2.3.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/product${product.id}.png",
                fit: BoxFit.contain),
            // Image.network(product.image!, fit: BoxFit.contain),
          )),
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
                                "assets/images/product${product.id}.png",
                                fit: BoxFit.contain),
                            // Image.network(product.image!, fit: BoxFit.contain),
                          ));
                    }))
          ],
        ),
      ),
    ]);
  }
}
