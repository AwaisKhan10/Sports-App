// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: scaffoldColor,
      shadowColor: scaffoldColor,
      foregroundColor: blackColor,
      backgroundColor: scaffoldColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text(
        "$title",
        style: style18B.copyWith(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
    );
  }
}
