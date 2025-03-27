// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/model/scroll_view.dart';

class CustomTweetCardWidget extends StatelessWidget {
  final TweetModel tweetObject;

  const CustomTweetCardWidget({required this.tweetObject});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header (Profile Image + Username + Time)
            Row(
              children: [
                if (tweetObject.imageUrl != null)
                  CircleAvatar(
                    backgroundImage: AssetImage(tweetObject.imageUrl!),
                    radius: 30.r,
                  ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tweetObject.username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tweetObject.handle,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(tweetObject.timeAgo, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10.h),

            /// Tweet Content
            Text(tweetObject.content, style: TextStyle(fontSize: 16.sp)),

            /// Link with "FULL VIDEO:" text
            if (tweetObject.link != null)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Row(
                  children: [
                    Text(
                      "FULL VIDEO: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle link tap if needed
                      },
                      child: Text(
                        tweetObject.link!,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
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
