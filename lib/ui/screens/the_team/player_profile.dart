import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';

class PlayerProfileScreen extends StatelessWidget {
  final TeamPlayerModel player;

  const PlayerProfileScreen({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: 'Player Profile'),
      ),
      backgroundColor: scaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            60.verticalSpace,
            _buildPlayerInfo(context),
            20.verticalSpace,
            _buildCareerStatistics(),
            20.verticalSpace,
            _buildPerformanceChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33, // Increased height
      child: Stack(
        clipBehavior: Clip.none, // Prevent clipping of children
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets().profileBack,
            scale: 1,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Positioned(
            top:
                MediaQuery.of(context).size.height *
                0.23, // Adjusted for proper overlap
            child: CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 67.r,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: player.profileImage,
                    fit: BoxFit.cover,
                    width: 134.r,
                    height: 134.r,
                    placeholder:
                        (context, url) => Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        ),
                    errorWidget:
                        (context, url, error) => Icon(Icons.person, size: 67.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return SizedBox(
    //   height: 250.h,
    //   child: Stack(
    //     clipBehavior: Clip.none,
    //     alignment: Alignment.center,
    //     children: [
    //       // Background image or color
    //       Container(height: 200.h, width: double.infinity, color: primaryColor),
    //       // Profile image
    //       Positioned(
    //         bottom: 0,
    //         child: CircleAvatar(
    //           radius: 70.r,
    //           backgroundColor: Colors.white,
    //           child: CircleAvatar(
    //             radius: 67.r,
    //             backgroundImage: NetworkImage(player.profileImage),
    //             onBackgroundImageError:
    //                 (exception, stackTrace) => Icon(Icons.person, size: 67.r),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildPlayerInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Player name and position
          Container(
            color: blackColor,
            height: 50.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  player.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                    fontSize: 18.sp,
                  ),
                ),
                Container(height: 44.h, width: 2, color: whiteColor),
                Text(
                  '${player.number} - ${player.position}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          // Personal details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow("Height", player.height),
              _buildDetailRow("Birth Date", player.dob),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow("Weight", player.weight),
              _buildDetailRow("Birth Place", player.birthPlace),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title  ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.sp),
              overflow: TextOverflow.ellipsis,
            ),
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
          Container(
            color: blackColor,
            height: 50.h,
            width: double.infinity,
            child: Center(
              child: Text(
                'Career Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
          20.verticalSpace,
          _buildStatisticRow('Minutes Played', player.minutesPlayed),
          _buildStatisticRow('Games Played', player.gamesPlayed),
          _buildStatisticRow('Goals', player.goals),
          _buildStatisticRow('Assists', player.assists),
        ],
      ),
    );
  }

  Widget _buildStatisticRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          Text(value, style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatBox(player.shots, "Shots", Color(0xff183D8C)),
          SizedBox(
            height: 139.h,
            width: 139.w,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: primaryColor,
                    value: double.parse(player.onGoal),
                    radius: 20.r,
                    title: '',
                  ),
                  PieChartSectionData(
                    color: secondaryColor,
                    value: double.parse(player.shots),
                    radius: 20.r,
                    title: '',
                  ),
                ],
                centerSpaceRadius: 50,
                sectionsSpace: 0,
                startDegreeOffset: -90,
              ),
            ),
          ),
          _buildStatBox(player.onGoal, "On Goal", Color(0xffCD1E38)),
        ],
      ),
    );
  }

  Widget _buildStatBox(String value, String label, Color color) {
    return Container(
      height: 45.h,
      width: 95.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: 5.w),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
        ],
      ),
    );
  }
}
