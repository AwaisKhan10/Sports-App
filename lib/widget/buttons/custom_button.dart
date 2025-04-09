import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;

  final Color textColor;
  final VoidCallback? onPressed;

  const CustomButton({
    required this.color,
    required this.title,

    required this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title, style: style16B.copyWith(color: textColor)),
      ),
    );
  }
}
