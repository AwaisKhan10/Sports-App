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
            backgroundColor: scaffoldColor,
            appBar: AppBar(backgroundColor: whiteColor),
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
                Container(
                  child: Expanded(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Image.asset(
                                AppAssets().player,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Image.asset(
                                AppAssets().player,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              ),
                            ),
                          ],
                        ),

                        Positioned(
                          top: 0,
                          //left: 0,
                          //right: 0,
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:sports_app/core/constant/app_assets.dart';
// import 'package:sports_app/core/constant/colors.dart';
// import 'package:sports_app/core/constant/text_style.dart';
// import 'package:sports_app/core/model/ticket.dart';
// import 'package:sports_app/ui/screens/fan_engagement/fan_engagement_view_model.dart';
// import 'package:sports_app/widget/drop_down_expendable_button.dart';
// import 'package:sports_app/widget/main_tickt_screen_card.dart';

// class FanEngagementScreen extends StatelessWidget {
//   const FanEngagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => FanEngagementViewModel(),
//       child: Consumer<FanEngagementViewModel>(
//         builder: (context, value, child) {
//           return Scaffold(
//             backgroundColor: scaffoldColor,
//             appBar: AppBar(backgroundColor: whiteColor),
//             body: Stack(
//               children: [
//                 // Background content (images and cards)
//                 Positioned.fill(
//                   top: 180.h, // Adjust this value to control overlap amount
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Image.asset(
//                               AppAssets().player,
//                               fit: BoxFit.cover,
//                               height: 200.h,
//                             ),
//                           ),
//                           SizedBox(width: 16.w),
//                           Expanded(
//                             child: Image.asset(
//                               AppAssets().player,
//                               fit: BoxFit.cover,
//                               height: 200.h,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTicketCard(
//                         ticketObject: TicketScreenModel(
//                           imageUrl: AppAssets().wallIcon,
//                           title: 'Fan Engagement',
//                           subTitle: 'Wall',
//                         ),
//                       ),
//                       SizedBox(height: 20.h),
//                       CustomTicketCard(
//                         ticketObject: TicketScreenModel(
//                           imageUrl: AppAssets().wallIcon,
//                           title: 'BOMBA',
//                           subTitle: 'PRECISION',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Blue welcome container
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     padding: EdgeInsets.all(20.w),
//                     margin: EdgeInsets.symmetric(horizontal: 16.w),
//                     decoration: BoxDecoration(
//                       color: Colors.blue, // Use your app's blue color
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Welcome to Fan Engagement!',
//                           style: style25B.copyWith(color: Colors.white),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           'This exciting area gives you a chance to be part of activities going on around the stadium. Start by tapping the button below and posting a photo to the Fan Engagement Wall. More coming soon!',
//                           style: style16.copyWith(color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 20.h),
//                         // Add your button here if needed
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
