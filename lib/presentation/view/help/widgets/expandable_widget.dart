import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/custom_text.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({required this.helpItem, this.titleColor, Key? key})
      : super(key: key);
  final HelpModel helpItem;

  final Color? titleColor;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(top: 2.9.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(blurRadius: 6, color: AppColor.grey, spreadRadius: 1)
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: widget.helpItem.question!,
                color: widget.titleColor,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
            IconButton(
                onPressed: () {
                  isExpanded = !isExpanded;
                  setState(() {});
                },
                icon: isExpanded
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down)),
          ],
        ),
        isExpanded
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                child: CustomText(
                  text: widget.helpItem.answer!,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: AppColor.customGrey,
                  fontSize: 12.sp,
                ),
              )
            : Container(),
      ]),
    );
  }
}
