import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:shimmer/shimmer.dart';

class CustomTeamPlayerShimmer extends StatelessWidget {
  final TeamPlayerModel player;
  final VoidCallback? onTap;
  const CustomTeamPlayerShimmer({super.key, required this.player, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.white, // Placeholder color for shimmer effect
                  ),
                ),
                15.0.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.w,
                      height: 20.h,
                      color: Colors.white, // Placeholder for the player's name
                    ),
                    5.0.verticalSpace,
                    Container(
                      width: 100.w,
                      height: 18.h,
                      color:
                          Colors
                              .white, // Placeholder for the player's number and position
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
