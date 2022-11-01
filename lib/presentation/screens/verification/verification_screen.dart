import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import 'package:magdsoft_flutter_structure/business_logic/verification_cubit/verification_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  //controllers for digits of the code
  final _first = TextEditingController();
  final _second = TextEditingController();
  final _third = TextEditingController();
  final _fourth = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const LinearGradientBackground(),
          Padding(
            padding: EdgeInsets.only(top: 6.7.h),
            child: Column(
              children: [
                CustomText(
                  text: "Verify Phone",
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 28.sp,
                  color: AppColor.white,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 14.8.h,
                            bottom: 10.9.h,
                            left: 10.w,
                            right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                              width: 16.3.w,
                              height: 8.6.h,
                              borderRadius: 15,
                              child: CustomTextFormField(
                                  controller: _first,
                                  fontSize: 40,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textColor: AppColor.primary),
                            ),
                            CustomContainer(
                              width: 16.3.w,
                              height: 8.6.h,
                              borderRadius: 15,
                              child: CustomTextFormField(
                                  controller: _second,
                                  fontSize: 40,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textColor: AppColor.primary),
                            ),
                            CustomContainer(
                              width: 16.3.w,
                              height: 8.6.h,
                              borderRadius: 15,
                              child: CustomTextFormField(
                                  controller: _third,
                                  fontSize: 40,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textColor: AppColor.primary),
                            ),
                            CustomContainer(
                              width: 16.3.w,
                              height: 8.6.h,
                              borderRadius: 15,
                              child: CustomTextFormField(
                                  controller: _fourth,
                                  fontSize: 40,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  textAlign: TextAlign.center,
                                  textColor: AppColor.primary),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          child: CustomText(
                              text: "Resend Code",
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: AppColor.primary)),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8.4.h, left: 10.w, right: 10.w),
                        child:
                            BlocConsumer<VerificationCubit, VerificationState>(
                          listener: (context, state) {
                            if (state is VerificationSuccess) {
                              showToast(context, state.message);
                              Navigator.popAndPushNamed(context, helpScreen);
                            } else if (state is VerificationFailed) {
                              showToast(context, state.errorMessage);
                            }
                          },
                          builder: (context, state) {
                            return state is VLoadingState
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    text: "Verify",
                                    buttonHeight: 6.h,
                                    onPressed: () {
                                      BlocProvider.of<VerificationCubit>(
                                              context)
                                          .verify(
                                              code:
                                                  "${_first.text}${_second.text}${_third.text}${_fourth.text}");
                                    },
                                  );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
