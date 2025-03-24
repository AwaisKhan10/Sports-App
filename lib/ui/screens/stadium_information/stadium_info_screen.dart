import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/%20%20ticketing/%20%20ticketing_screen.dart';
import 'package:sports_app/ui/screens/%20%20ticketing/ticketing_view_model.dart';
import 'package:sports_app/ui/screens/parking/getting_help.dart';
import 'package:sports_app/ui/screens/parking/parking_diagram.dart';
import 'package:sports_app/ui/screens/parking/parking_tips.dart';
import 'package:sports_app/ui/screens/stadium_information/faqs.dart';
import 'package:sports_app/ui/screens/stadium_information/guest_services.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_amenities.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_assist_screen.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class StadiumInformationScreen extends StatelessWidget {
  const StadiumInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TicketingViewModel(),
      child: Consumer<TicketingViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
            backgroundColor: scaffoldColor,
            body: Column(
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'qwertyuiopkjnbvcdhghchbkcbchbjdshcbhcbwhcbwybwydqwertyuidfghjwertyuwertyrtyuilkmn cfghjnb',
                ),

                Expanded(
                  child: Center(
                    child: Wrap(
                      spacing: 20.w,
                      runSpacing: 20.h,
                      children: [
                        CustomTicketCard(
                          onTap: () {
                            Get.to(StadiumInfoAmenitiesScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().purchase,
                            title: 'Amenities',
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(GuestServicesScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().guest,
                            title: 'Guest Service',
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(GettingHelpScreen());
                          },
                          child: CustomTicketCard(
                            ticketObject: TicketScreenModel(
                              imageUrl: AppAssets().contact,
                              title: 'Getting Help',
                            ),
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(TicketingScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().parking,
                            title: 'Parking',
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(FaqsScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().seats,
                            title: 'A-Z Guide',
                            subTitle: 'and FAQs',
                          ),
                        ),
                        CustomTicketCard(
                          onTap: () {
                            Get.to(StadiumAssistScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().contact,
                            title: 'Stadium',
                            subTitle: 'Assistant',
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
