import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/scroll_view_show_upcoming.dart';

class CustomShowUpcomingWIdget extends StatelessWidget {
  final ShowUpcomingModel showUpcomingModelObject;
  const CustomShowUpcomingWIdget({
    super.key,
    required this.showUpcomingModelObject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(showUpcomingModelObject.imageUrl, scale: 1),
            ),
          ),
          10.horizontalSpace,
          Text(
            showUpcomingModelObject.name,
            style: style18.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
