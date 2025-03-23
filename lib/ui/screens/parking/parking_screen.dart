import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/parking/getting_help.dart';
import 'package:sports_app/ui/screens/parking/parking_diagram.dart';
import 'package:sports_app/ui/screens/parking/parking_tips.dart';
import 'package:sports_app/ui/screens/parking/parking_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tick_screen_card.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParkingViewModel(),
      child: Consumer<ParkingViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'qwertyuioplkjhgfdazxcvbnm,klpoiuytrewqazxcvbnmklkjhgfdsaqwertyuiopkmnbvcxsawertyuioplkjhgfdsazxcvbnm,lpoiuytrewqasdfghjkl,mnbvcxza',
                ),
                Expanded(
                  child: Center(
                    child: Wrap(
                      spacing: 20.w,
                      runSpacing: 20.h,
                      children: [
                        CustomTicketCard(
                          onTap: () {
                            Get.to(ParkingDiagramScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().purchase,
                            title: 'Parking',
                            subTitle: 'Diagram',
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(ParkingTipsScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().ticket,
                            title: 'Parking',
                            subTitle: 'Tips',
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(GettingHelpScreen());
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
