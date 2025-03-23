import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/purchase_tickets.dart';

class CustomPurchaseTicketWidget extends StatelessWidget {
  final PurchaseTicketModel match;

  const CustomPurchaseTicketWidget({Key? key, required this.match})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Increased border radius
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          15,
        ), // Ensures child elements follow the border radius
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 55.w,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15), // Increased border radius
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    match.date,
                    style: style16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    match.month,
                    style: style16B.copyWith(color: whiteColor),
                  ),
                  Text(
                    match.day,
                    style: style16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            15.horizontalSpace,
            Container(
              height: double.infinity,
              width: 75.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 28,
                ),
                child: Image.asset(
                  match.team1Logo,
                  // scale: 1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${match.team1}, \n VS ${match.team2},',
                    style: style18.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${match.time}, ${match.venue},\n ${match.location}',
                    style: style16.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
