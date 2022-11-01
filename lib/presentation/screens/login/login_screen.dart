import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/widgets/curved_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_container.dart';
import '../../widget/custom_text.dart';
import '../../widget/text_form_field.dart';
import 'widgets/opacity_image_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            /***
             * this widget contains image background and opacity
             */
            const OpacityImageWidget(),

            /***
             * this widget take around 70 of screen height 
             * contains Circle avatars for sign in with google...
             */
            const CurvedWidget(),

            /***
             * sign in widget which contains 
             * (Form{text fields, login button})
             */
            Padding(
              padding: EdgeInsets.only(top: 20.7.h),
              child: Center(
                child: CustomContainer(
                  width: 86.5.w,
                  height: 38.h,
                  borderRadius: 40,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 2.7.h,
                          bottom: 2.1.h,
                          left: 10.7.w,
                          right: 10.2.w),
                      child: Column(children: [
                        CustomText(
                            text: "Welcome",
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 30.sp),
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h),
                          child: const Divider(
                            indent: 60,
                            endIndent: 60,
                            thickness: 2.5,
                            color: Color.fromRGBO(0, 98, 189, 0.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.6.h),
                          child: SizedBox(
                            height: 14.5.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextFormField(
                                    hintText: "Enter your Full Name",
                                    controller: _nameController,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  CustomTextFormField(
                                    hintText: "Enter your Phone Number",
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ]),
                          ),
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              _isLoading = false;
                              showToast(context, state.message);
                              Navigator.pushNamed(context, verifyScreen);
                            } else if (state is LoginFailure) {
                              _isLoading = false;
                              showToast(context, state.errorMessage);
                            } else {
                              _isLoading = true;
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(top: 2.7.h),
                              child: _isLoading
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      text: "Login",
                                      buttonHeight: 5.h,
                                      onPressed: () {
                                        BlocProvider.of<LoginCubit>(context)
                                            .login(
                                                name: _nameController.text,
                                                phone: _phoneController.text);
                                      }),
                            );
                          },
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
