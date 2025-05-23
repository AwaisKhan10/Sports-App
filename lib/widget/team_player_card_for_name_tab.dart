import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomTeamPlayerNameCard extends StatelessWidget {
  final TeamPlayerModel player;
  final VoidCallback? onTap;
  const CustomTeamPlayerNameCard({super.key, required this.player, this.onTap});

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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100.h,
                  width: 80.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: player.profileImage!,
                      fit: BoxFit.cover,

                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.person, size: 50.r),
                    ),
                  ),
                ),
              ),
              15.0.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    player.name!,
                    style: style18.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${player.number} - ${player.position}",
                    style: style16.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
