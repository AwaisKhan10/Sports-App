import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final IconData? icon2;
  const CustomHeader({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.icon2,
  });

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
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(); // ✅ Correctly calling the function
              }
            },
            child: Icon(icon),
          ),
          Text(
            title,
            style: style20B.copyWith(color: blackColor, fontSize: 22.sp),
          ),
          Icon(icon2, color: blackColor),
        ],
      ),
    );
  }
}
