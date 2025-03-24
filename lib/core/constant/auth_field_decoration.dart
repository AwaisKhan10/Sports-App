import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16.copyWith(color: Color(0xffA5A5A5)),
  prefixIconColor: borderColor,
  suffixIconColor: borderColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
);

final FilterauthFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16.copyWith(color: blackColor),
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
  prefixIconColor: borderColor,
  suffixIconColor: borderColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
);
