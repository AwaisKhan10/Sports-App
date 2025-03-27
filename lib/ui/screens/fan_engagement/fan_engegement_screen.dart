import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/fan_engagement/fan_engagement_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class FanEngagementScreen extends StatelessWidget {
  const FanEngagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FanEngagementViewModel(),
      child: Consumer<FanEngagementViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            ///
            /// START BODY
            ///
            body: Column(
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'This exciting area gives you a chance to be part of \n activities going on around the stadium. Start by \n tapping the button below and posting a photo to the \n Fan Engagement Wall. More coming soon!',
                ),
                60.verticalSpace,
                Text('Welcome to Fan Engagement! ', style: style25B),
                Text(
                  style: style16,
                  textAlign: TextAlign.center,
                  'This exciting area gives you a chance to be part of \nactivities going on around the stadium. Start by \ntapping the button below and posting a photo to the \nFan Engagement Wall. More coming soon!',
                ),
                40.verticalSpace,

                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    // SizedBox(
                    //   height: 400,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemCount: 5,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         height: 400,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //             image: AssetImage(AppAssets().profileBack),
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 400,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets().profileBack),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: Container(
                              height: 400,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppAssets().profileBack),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,

                      child: CustomTicketCard(
                        ticketObject: TicketScreenModel(
                          imageUrl: AppAssets().wallIcon,
                          title: 'Fan Engagement',
                          subTitle: 'Wall',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
