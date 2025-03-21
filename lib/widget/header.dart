import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  const CustomHeader({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          Text(
            title,
            style: style20B.copyWith(color: blackColor, fontSize: 22.sp),
          ),
          Text('okj', style: TextStyle(color: whiteColor)),
        ],
      ),
    );
  }
}
