import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/product_cubit/product_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/category_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/grid_item.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum CategoryList { all, acer, razer }

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController firstController = ScrollController();
  final ScrollController secondController = ScrollController();
  static String selectedCategory = CategoryList.all.name;
  late List<ProductModel> products;
  @override
  void initState() {
    super.initState();

    firstController.addListener(() {
      if (firstController.hasClients && secondController.hasClients) {
        secondController.jumpTo(firstController.offset);
      }
    });
    BlocProvider.of<ProductCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductCubit>(context);

    return Scaffold(
      body: Stack(children: [
        const LinearGradientBackground(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 5.4.h, bottom: 2.4.h, left: 4.7.w, right: 4.7.w),
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
                            hintStyle: TextStyle(
                                color: AppColor.lightGrey, fontSize: 14.sp),
                            suffixIcon: const Icon(Icons.search,
                                color: AppColor.lightGrey),
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                  CustomContainer(
                      width: 11.6.w,
                      height: 5.4.h,
                      child: const Icon(Icons.filter_alt,
                          color: AppColor.lightGrey))
                ],
              ),
            ),
            SizedBox(
              width: 85.8.w,
              height: 18.9.h,
              child: Stack(alignment: AlignmentDirectional.center, children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/home_ads.png",
                        fit: BoxFit.cover),
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
            ),
            SizedBox(
              height: 10.7.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryItem(
                          itemName: "All",
                          selectedItem: selectedCategory,
                          onTap: () {
                            setState(() {
                              if (selectedCategory != CategoryList.all.name) {
                                bloc.filterProducts();
                                selectedCategory = CategoryList.all.name;
                              }
                            });
                          },
                        ),
                        SizedBox(width: 1.2.h),
                        CategoryItem(
                          itemName: "Acer",
                          selectedItem: selectedCategory,
                          onTap: () {
                            setState(() {
                              if (selectedCategory != CategoryList.acer.name) {
                                bloc.filterProducts(category: "Acer");
                                selectedCategory = CategoryList.acer.name;
                              }
                            });
                          },
                        ),
                        SizedBox(width: 1.2.h),
                        CategoryItem(
                          itemName: "Razer",
                          selectedItem: selectedCategory,
                          onTap: () {
                            setState(() {
                              if (selectedCategory != CategoryList.razer.name) {
                                bloc.filterProducts(category: "Razer");
                                selectedCategory = CategoryList.razer.name;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
                                      itemCount:
                                          bloc.filteredproducts.length ~/ 2,
                                      padding: const EdgeInsets.only(top: 8),
                                      itemBuilder: ((context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, productScreen,
                                                arguments:
                                                    bloc.filteredproducts[
                                                        index * 2]);
                                          },
                                          child: GridItem(
                                              product: bloc
                                                  .filteredproducts[index * 2]),
                                        );
                                      })),
                                )
                              ],
                            )),
                            SizedBox(width: 1.2.h),
                            Expanded(
                                child: ListView.builder(
                                    controller: secondController,
                                    itemCount:
                                        bloc.filteredproducts.length ~/ 2,
                                    padding: const EdgeInsets.only(top: 8),
                                    itemBuilder: ((context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, productScreen,
                                              arguments: bloc.filteredproducts[
                                                  (index * 2) + 1]);
                                        },
                                        child: GridItem(
                                            product: bloc.filteredproducts[
                                                (index * 2) + 1]),
                                      );
                                    })))
                          ],
                        );
                },
              ),
            ))
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: AppColor.grey,
        inactiveColor: AppColor.grey,
        icons: const [
          Icons.logout,
          Icons.favorite,
          Icons.notification_important,
          Icons.settings
        ],
        activeIndex: 1,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {},
      ),
    );
  }
}
