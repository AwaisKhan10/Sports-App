import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/%20%20scroll_view/scroll_view_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/scroll_view_show_upcoming.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomDropDownExpendableButton(
                  text:
                      'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                ),
              ),
              Text('Show upcoming', style: style18),
              20.verticalSpace,
              _UpComingShow(ScrollViewViewModel()),
              _UpComingShow(ScrollViewViewModel()),
              _UpComingShow(ScrollViewViewModel()),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _UpComingShow(ScrollViewViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Monday, April 2, 2004', style: style16.copyWith()),
                    Container(
                      height: 35.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Away',
                          style: style16.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
                if (model.showUpcomings.isNotEmpty) ...[
                  CustomShowUpcomingWIdget(
                    showUpcomingModelObject: model.showUpcomings[0],
                  ),
                  if (model.showUpcomings.length > 1)
                    CustomShowUpcomingWIdget(
                      showUpcomingModelObject: model.showUpcomings[1],
                    ),
                ],
                20.verticalSpace,
                Row(
                  children: [
                    Text("7:15 PM", style: style16B),
                    5.horizontalSpace,
                    Container(height: 16, width: 1.5, color: Colors.grey),
                    5.horizontalSpace,
                    Text(
                      "Avaya Stadium",
                      style: style16.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
