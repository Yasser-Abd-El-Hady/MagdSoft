import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/product_cubit/product_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/category_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/image_ads_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/grid_item.dart';
import 'package:sizer/sizer.dart';

import 'widgets/header_widget.dart';
import 'widgets/products_list_widget.dart';

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
            /**
              * this widget contain search bar and filter icon
             */
            const HeaderWidget(),

            /**
             * this widget contains ad image in the top of screen
             */
            const ImageAdsWidget(),
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

            /***
             * widget which contains blocbuilder to listen to data
             * which come from backend and show it
             */
            ProductsListWidget(
                firstController: firstController,
                bloc: bloc,
                secondController: secondController)
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
