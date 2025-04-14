import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MatchesShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // Show 5 shimmer cards
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(12),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Date + Away Tag
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 16, width: 120, color: Colors.grey),
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,

                    /// Home Team
                    Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                        8.horizontalSpace,
                        Container(height: 16, width: 100, color: Colors.grey),
                      ],
                    ),
                    12.verticalSpace,

                    /// Away Team
                    Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                        8.horizontalSpace,
                        Container(height: 16, width: 100, color: Colors.grey),
                      ],
                    ),
                    20.verticalSpace,

                    /// Time & Venue
                    Row(
                      children: [
                        Container(height: 16, width: 60, color: Colors.grey),
                        10.horizontalSpace,
                        Container(height: 16, width: 100, color: Colors.grey),
                      ],
                    ),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
