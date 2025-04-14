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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 90.w,
          height: 90.h,
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
              width: 30.w,
              height: 30.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
