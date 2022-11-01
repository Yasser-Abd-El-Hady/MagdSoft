import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_cubit/help_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help/widgets/expandable_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:sizer/sizer.dart';
import 'widgets/expandable_widget.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HelpCubit>(context).getData();
    return Scaffold(
      body: Stack(children: [
        const LinearGradientBackground(),
        BlocBuilder<HelpCubit, HelpState>(
          builder: (context, state) {
            BlocProvider.of<HelpCubit>(context).getData();
            return Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 6.7.h, left: 4.2.w, right: 4.2.w, bottom: 4.1.h),
                child: CustomText(
                    text: "Help",
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 28.sp,
                    color: AppColor.white),
              ),
              Expanded(
                  /**
               * if data is comming from database show CircularProgressIndicator
               */
                  child: state is HelpInitial
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: EdgeInsets.only(
                            left: 4.2.w,
                            right: 4.2.w,
                          ),
                          itemCount: BlocProvider.of<HelpCubit>(context)
                              .allhelp
                              .length,
                          itemBuilder: ((context, index) {
                            return ExpandableWidget(
                                helpItem: BlocProvider.of<HelpCubit>(context)
                                    .allhelp[index],
                                titleColor: AppColor.primary);
                          }))),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 2.7.h, left: 17.2.w, right: 17.2.w),
                child: CustomButton(
                    text: "Continue",
                    buttonHeight: 5.2.h,
                    onPressed: () {
                      Navigator.pushNamed(context, homeScreen);
                    }),
              )
            ]);
          },
        ),
      ]),
    );
  }
}
