// 🔹 Custom Button Widget
import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomFilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomFilterButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(97, 65), // Button Size
        elevation: 4, // Adds shadow effect
      ),
      child: Text(text, style: style16.copyWith(color: whiteColor)),
    );
  }
}
