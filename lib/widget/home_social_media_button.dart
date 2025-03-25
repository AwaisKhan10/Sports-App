import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialMediaIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const CustomSocialMediaIcon({
    required this.imagePath,
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96.w,
        height: 96.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
