import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: scaffoldColor,
      shadowColor: scaffoldColor,
      foregroundColor: blackColor,
      backgroundColor: scaffoldColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text(
        "$title",
        style: style20B.copyWith(color: blackColor, fontSize: 22.sp),
      ),
    );
  }
}
