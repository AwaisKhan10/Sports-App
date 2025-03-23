import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/%20%20scroll_view/scroll_view_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';
import 'package:sports_app/widget/scroll_view_screen_widget.dart';
import 'package:sports_app/widget/scroll_view_show_upcoming.dart';

class ScrollViewScreen extends StatelessWidget {
  final ScrollViewViewModel model = Get.put(ScrollViewViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: whiteColor),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomHeader(title: 'Scroll View'),
              CustomDropDownExpendableButton(
                text: 'dfghjhgfghjhgfhjhgfghjhgfh',
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.1,
                ),

                itemCount: model.tweets.length,
                itemBuilder: (context, index) {
                  return CustomTweetCardWidget(
                    tweetObject: model.tweets[index],
                  );
                },
              ),
              _UpComingShow(),
              50.verticalSpace,
            ],
          ),
        );
      }),
    );
  }

  Widget _UpComingShow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Show upcoming', style: style18),
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
                      Text('Monday, April 2,2004', style: style16.copyWith()),
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
                  CustomShowUpcomingWIdget(
                    showUpcomingModelObject: model.showUpcomings[0],
                  ),
                  CustomShowUpcomingWIdget(
                    showUpcomingModelObject: model.showUpcomings[1],
                  ),
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
      ),
    );
  }
}
