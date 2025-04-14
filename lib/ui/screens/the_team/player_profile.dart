import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sports_app/widget/shimmer/player_profile_shimmer.dart';

class PlayerProfileScreen extends StatefulWidget {
  final TeamPlayerModel player;

  const PlayerProfileScreen({Key? key, required this.player}) : super(key: key);

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate loading delay or actual API call
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // After data is fetched
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: 'Player Profile'),
      ),
      backgroundColor: scaffoldColor,
      body:
          _isLoading
              ? PlayerProfileShimmer()
              : SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileHeader(context),
                    90.verticalSpace,
                    _buildPlayerInfo(context),
                    20.verticalSpace,
                    _buildCareerStatistics(),
                    20.verticalSpace,
                    _buildPerformanceChart(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          _buildStatisticRow('Goals', widget.player.goals!),
                          _buildStatisticRow('Assists', widget.player.assists!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildProfileHeader(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23, // Increased height
      child: Stack(
        clipBehavior: Clip.none, // Prevent clipping of children
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets().profileBack,

            fit: BoxFit.cover,
            width: double.infinity,
          ),

          Positioned(
            top:
                MediaQuery.of(context).size.height *
                0.16, // Adjusted for proper overlap
            child: CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 67.r,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.player.profileImage!,
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
                  widget.player.name!,
                  style: style18B.copyWith(color: whiteColor),
                ),
                Container(height: 25.h, width: 1.5, color: whiteColor),
                Text(
                  '${widget.player.number} - ${widget.player.position}',
                  style: style16.copyWith(color: whiteColor),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          // Personal details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow("Height", widget.player.height!),
              _buildDetailRow("Birth Date", widget.player.dob!),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow("Weight", widget.player.weight!),
              _buildDetailRow("Birth Place", widget.player.birthPlace!),
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
          Text("$title  ", style: style16B),
          Flexible(
            child: Text(value, style: style14, overflow: TextOverflow.ellipsis),
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
                style: style18B.copyWith(color: whiteColor),
              ),
            ),
          ),
          20.verticalSpace,
          _buildStatisticRow('Minutes Played', widget.player.minutesPlayed!),
          _buildStatisticRow('Games Played', widget.player.gamesPlayed!),
        ],
      ),
    );
  }

  Widget _buildStatisticRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title, style: style16B), Text(value, style: style14)],
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatBox(widget.player.shots!, "Shots", Color(0xff183D8C)),
            SizedBox(
              height: 139.h,
              width: 139.w,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: primaryColor,
                      value: double.tryParse(widget.player.onGoal!) ?? 1.0,

                      radius: 20.r,
                      title: '',
                    ),
                    PieChartSectionData(
                      color: secondaryColor,
                      value: double.tryParse(widget.player.shots!) ?? 1.0,
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
            _buildStatBox(widget.player.onGoal!, "On Goal", Color(0xffCD1E38)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String value, String label, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(value, style: style16B.copyWith(color: whiteColor)),
            ),
            SizedBox(width: 5.w),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(label, style: style14B.copyWith(color: whiteColor)),
            ),
          ],
        ),
      ),
    );
  }
}
