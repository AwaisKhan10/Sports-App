import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomRegisterButton extends StatelessWidget {
  final Color color;
  final String title;
  final String? imageUrl;
  final Color textColor;
  final VoidCallback? onPressed;

  const CustomRegisterButton({
    required this.color,
    required this.title,
    this.imageUrl,
    required this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imageUrl != null)
                Container(
                  height: 35.h,
                  width: 35.w,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Image.asset(imageUrl!, color: whiteColor),
                  ),
                ),
              4.horizontalSpace,
              Text(title, style: style16B.copyWith(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
