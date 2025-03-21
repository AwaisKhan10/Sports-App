import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16,
  prefixIconColor: blackColor,
  suffixIconColor: blackColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blackColor, width: 1.0),
    borderRadius: BorderRadius.circular(16),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blackColor, width: 1.0),
    borderRadius: BorderRadius.circular(16),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blackColor, width: 1.0),
    borderRadius: BorderRadius.circular(16),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blackColor, width: 1.0),
    borderRadius: BorderRadius.circular(16),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blackColor, width: 1.0),
    borderRadius: BorderRadius.circular(16),
  ),
);
