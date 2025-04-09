import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        alignment: Alignment.center,
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl != null ? Image.asset(imageUrl!, scale: 4) : SizedBox(),
            30.horizontalSpace,
            Text(title, style: style16B.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
