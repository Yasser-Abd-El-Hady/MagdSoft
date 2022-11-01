import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.controller,
      this.labelName,
      this.hintText,
      this.textAlign = TextAlign.start,
      this.textColor,
      this.fontSize,
      this.validator,
      this.keyboardType,
      this.obscureText = false,
      this.obscuringCharacter = '•',
      this.maxLength,
      this.withBorder = true,
      Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final String? labelName;
  final String? hintText;
  final TextAlign textAlign;
  final Color? textColor;
  final double? fontSize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String obscuringCharacter;
  final int? maxLength;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: withBorder
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(blurRadius: 3, color: AppColor.grey, spreadRadius: 1)
              ],
            )
          : null,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        textAlign: textAlign,
        style: TextStyle(color: textColor, fontSize: fontSize),
        decoration: InputDecoration(
          labelText: labelName,

          labelStyle: const TextStyle(color: AppColor.grey),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.grey, fontSize: 14),
          contentPadding: const EdgeInsets.all(10),
          // enabledBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: AppColor.white)),
          // focusedBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.lightBlue)),
          border: InputBorder.none,
        ),
        validator: validator,
        textInputAction: TextInputAction.next,
        maxLength: maxLength,
        buildCounter: (context,
            {currentLength = 0, isFocused = false, maxLength = 1}) {
          return null;
        },
      ),
    );
  }
}
