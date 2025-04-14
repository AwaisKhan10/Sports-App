import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sports_app/core/constant/colors.dart';

class TweetCardShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(6),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return TweetCardShimmer();
        },
      ),
    );
  }
}

class TweetCardShimmer extends StatelessWidget {
  const TweetCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      padding: EdgeInsets.all(12.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16.h,
                        width: 100.w,
                        color: Colors.white,
                      ),
                      SizedBox(height: 5.h),
                      Container(height: 14.h, width: 60.w, color: Colors.white),
                    ],
                  ),
                ),
                Container(height: 14.h, width: 40.w, color: Colors.white),
              ],
            ),

            SizedBox(height: 10.h),

            /// Text Placeholder
            Container(
              height: 16.h,
              width: double.infinity,
              color: Colors.white,
            ),

            SizedBox(height: 10.h),

            /// Image Placeholder
            Container(
              height: 160.h,
              width: double.infinity,
              color: Colors.white,
            ),

            SizedBox(height: 12.h),

            /// Like & Comment Row
            Row(
              children: [
                Container(height: 20.r, width: 20.r, color: Colors.white),
                SizedBox(width: 4.w),
                Container(height: 14.h, width: 20.w, color: Colors.white),
                SizedBox(width: 16.w),
                Container(height: 20.r, width: 20.r, color: Colors.white),
                SizedBox(width: 4.w),
                Container(height: 14.h, width: 20.w, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
