import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/parking/getting_help.dart';
import 'package:sports_app/ui/screens/parking/parking_diagram.dart';
import 'package:sports_app/ui/screens/parking/parking_tips.dart';
import 'package:sports_app/ui/screens/parking/parking_view_model.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParkingViewModel(),
      child: Consumer<ParkingViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            ///
            /// App Bar
            ///
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(title: 'Parking'),
            ),

            ///
            /// Start Body
            ///
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                ),
                Expanded(
                  child: Center(
                    child: Wrap(
                      spacing: 20.w,
                      runSpacing: 20.h,
                      children: [
                        CustomTicketCard(
                          onTap: () {
                            Get.to(() => ParkingDiagramScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().purchase,
                            title: 'Parking',
                            subTitle: 'Diagram',
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(() => ParkingTipsScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().ticket,
                            title: 'Parking',
                            subTitle: 'Tips',
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => GettingHelpScreen());
                          },
                          child: CustomTicketCard(
                            ticketObject: TicketScreenModel(
                              imageUrl: AppAssets().contact,
                              title: 'Getting',
                              subTitle: 'Here',
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
