import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLineWithText extends StatelessWidget {
  final String text;
  final double lineWidth; // New parameter to set line width

  const CustomLineWithText({
    super.key,
    required this.text,
    this.lineWidth = 0.0, // Default line width
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content
      children: [
        Expanded(
          child: Container(
            width: lineWidth, // Set the width of the line
            height: 1.0,
            color: Colors.grey, // Line color
          ),
        ),
        5.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        5.horizontalSpace,
        Expanded(
          child: Container(
            width: lineWidth, // Set the width of the line
            height: 1.0,
            color: Colors.grey, // Line color
          ),
        ),
      ],
    );
  }
}
