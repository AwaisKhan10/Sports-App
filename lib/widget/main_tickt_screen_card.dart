import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';

class CustomTicketCard extends StatelessWidget {
  final TicketScreenModel ticketObject;
  final VoidCallback? onTap; // Callback function
  const CustomTicketCard({super.key, required this.ticketObject, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(ticketObject.imageUrl, scale: 1),
              ),
            ),
            4.verticalSpace,
            Text(
              ticketObject.title,
              style: style16.copyWith(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ticketObject.subTitle!,
              style: style16.copyWith(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
