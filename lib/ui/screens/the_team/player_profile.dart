import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/the_team/team_view_model.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/header.dart';
import 'package:fl_chart/fl_chart.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel(),
      child: Consumer<TeamViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            ///
            /// App Bar
            ///
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(title: 'Player Profile'),
            ),

            ///
            /// Start Body
            ///
            backgroundColor: scaffoldColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        0.33, // Increased height
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
                              backgroundImage: AssetImage(AppAssets().player),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  60.verticalSpace,
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            color: blackColor,
                            height: 50.h,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Francois Affolter',
                                  style: style18.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: whiteColor,
                                  ),
                                ),
                                Container(
                                  height: 44.h,
                                  width: 2,
                                  color: whiteColor,
                                ),
                                Text(
                                  '09 - Defender',
                                  style: style18.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDetailRow("Height", "5’8"),
                              _buildDetailRow("Birth Date", "29 Apr, 1992"),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDetailRow("Weight", "172 lbs"),
                              _buildDetailRow(
                                "Birth Place",
                                "Zurich, Switzerland",
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          _careerStatistics(),
                          20.verticalSpace,
                          _chart(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
            style: style16.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Flexible(
            child: Text(
              value,
              style: style16.copyWith(fontSize: 16),
              overflow: TextOverflow.ellipsis, // Prevents text from overflowing
            ),
          ),
        ],
      ),
    );
  }

  Widget _careerStatistics() {
    return Column(
      children: [
        Container(
          color: blackColor,
          height: 50.h,
          width: double.infinity,
          child: Center(
            child: Text(
              'Career Statistics',
              style: style18.copyWith(
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
          ),
        ),
        20.verticalSpace,
        _BuildStatisticDetailRow('Minutes Played', '1234 Min'),
        _BuildStatisticDetailRow('Games Played', '12'),
      ],
    );
  }

  Widget _BuildStatisticDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: style16.copyWith(fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis, // Prevents text from overflowing
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: style16.copyWith(),
            overflow: TextOverflow.ellipsis, // Prevents text from overflowing
          ),
        ),
      ],
    );
  }

  ///
  ///  chart
  ///
  Widget _chart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatBox("12", "Shots", Color(0xff183D8C)),
        SizedBox(
          height: 139.h,
          width: 139.w,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: primaryColor,
                  value: 4, // Shots on goal
                  radius: 20.r,
                  title: '',
                ),
                PieChartSectionData(
                  color: secondaryColor,
                  value: 12, // Total shots
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
        _buildStatBox("4", "On Goal", Color(0xffCD1E38)),
      ],
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
