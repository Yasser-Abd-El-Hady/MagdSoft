import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/product_cubit/product_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/grid_item.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    Key? key,
    required this.firstController,
    required this.bloc,
    required this.secondController,
  }) : super(key: key);

  final ScrollController firstController;
  final ProductCubit bloc;
  final ScrollController secondController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(right: 1.2.h, left: 4.7.w),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state is ProductInitial
              ? const Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        CustomText(
                            text: "Recommended for You",
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp),
                        Expanded(
                          child: ListView.builder(
                              controller: firstController,
                              itemCount: bloc.filteredproducts.length ~/ 2,
                              padding: const EdgeInsets.only(top: 8),
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, productScreen,
                                        arguments:
                                            bloc.filteredproducts[index * 2]);
                                  },
                                  child: GridItem(
                                      product:
                                          bloc.filteredproducts[index * 2]),
                                );
                              })),
                        )
                      ],
                    )),
                    SizedBox(width: 1.2.h),
                    Expanded(
                        child: ListView.builder(
                            controller: secondController,
                            itemCount: bloc.filteredproducts.length ~/ 2,
                            padding: const EdgeInsets.only(top: 8),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, productScreen,
                                      arguments: bloc
                                          .filteredproducts[(index * 2) + 1]);
                                },
                                child: GridItem(
                                    product:
                                        bloc.filteredproducts[(index * 2) + 1]),
                              );
                            })))
                  ],
                );
        },
      ),
    ));
  }
}
