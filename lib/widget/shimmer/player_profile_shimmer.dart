import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sports_app/core/constant/colors.dart';

class PlayerProfileShimmer extends StatelessWidget {
  const PlayerProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            60.verticalSpace,
            _buildPlayerInfo(),
            20.verticalSpace,
            _buildCareerStatistics(),
            20.verticalSpace,
            _buildPerformanceChart(),
          ],
        ),
      ),
    );
  }

  Widget shimmerContainer({
    double? height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: Stack(
        alignment: Alignment.center,
        children: [
          shimmerContainer(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.23,
            child: shimmerContainer(
              height: 134.r,
              width: 134.r,
              borderRadius: BorderRadius.circular(67.r),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          shimmerContainer(height: 50.h, width: double.infinity),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerContainer(height: 20.h, width: 100.w),
              shimmerContainer(height: 20.h, width: 100.w),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerContainer(height: 20.h, width: 100.w),
              shimmerContainer(height: 20.h, width: 100.w),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCareerStatistics() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          shimmerContainer(height: 50.h, width: double.infinity),
          20.verticalSpace,
          ...List.generate(
            4,
            (_) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerContainer(height: 20.h, width: 150.w),
                  shimmerContainer(height: 20.h, width: 50.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            shimmerContainer(height: 45.h, width: 90.w),
            SizedBox(width: 10.w),
            shimmerContainer(
              height: 139.h,
              width: 139.w,
              borderRadius: BorderRadius.circular(70.r),
            ),
            SizedBox(width: 10.w),
            shimmerContainer(height: 45.h, width: 90.w),
          ],
        ),
      ),
    );
  }
}
