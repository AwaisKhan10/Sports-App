import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/notifcation.dart';

class CustomNotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const CustomNotificationCard({Key? key, required this.notification})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: whiteColor, // Light background
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Move logo down
              children: [
                Image.asset(
                  notification.imageUrl,
                  width: 50,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            SizedBox(width: 12), // Space between logo and text
            // Right Side - Column with text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    notification.title,
                    style: style16.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 4), // Space between title & date
                  // Date
                  Text(
                    notification.fullDate,
                    style: style14.copyWith(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 6), // Space between date & description
                  // Description
                  Text(
                    notification.description,
                    style: style16.copyWith(
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                    ),
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
