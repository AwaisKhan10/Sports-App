import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_amenities.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class ConcessionScreen extends StatelessWidget {
  const ConcessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: Column(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width * 1,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Space between images
              children: [
                Expanded(
                  child: Image.asset(
                    AppAssets().player,
                    fit: BoxFit.cover,
                    height: 250.h,
                  ),
                ),
                const SizedBox(width: 16), // Space between images
                Expanded(
                  child: Image.asset(
                    AppAssets().player,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
              ],
            ),
          ),
          60.verticalSpace,
          Text(
            'Who\'s Hungary !',
            style: style25B,
            textAlign: TextAlign.center,
          ),
          Text(
            'Welcome to the Concessions area. Here you may \n access locations for purchasing stadium \n concessions items. Tap the button below to find out \n what\'s available.',
            style: style16N,
            textAlign: TextAlign.center,
          ),
          90.verticalSpace,
          CustomTicketCard(
            onTap: () {
              Get.to(() => StadiumInfoAmenitiesScreen());
            },
            ticketObject: TicketScreenModel(
              imageUrl: AppAssets().guest,
              title: 'Concessions',
            ),
          ),
        ],
      ),
    );
  }
}
