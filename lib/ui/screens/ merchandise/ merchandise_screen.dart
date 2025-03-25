import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/%20merchandise/online_store_screen.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class MerchandiseScreen extends StatelessWidget {
  const MerchandiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: whiteColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
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
                      height: 380.h,
                    ),
                  ),
                  const SizedBox(width: 16), // Space between images
                  Expanded(
                    child: Image.asset(
                      AppAssets().player,
                      fit: BoxFit.cover,
                      height: 380,
                    ),
                  ),
                ],
              ),
            ),
            30.verticalSpace,
            Text(
              'Shop at the Stadium !',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            Text(
              'Team Store Hours:',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            Text(
              'Mon-Fri 10:00 AM - 3:00 PM',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            Text(
              'Gamedays: Open 2 hours before k off!',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            Text(
              'Shop outside the stadium! Visit us at the bak Ridge \n Mall.',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            Text(
              'Shop online! Hit the button below to ab your gear.',
              style: style16N,
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            CustomTicketCard(
              onTap: () {
                Get.to(() => OnlineStoreScreen());
              },
              ticketObject: TicketScreenModel(
                imageUrl: AppAssets().tShirt,
                title: 'Shop',
                subTitle: 'merchandise',
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
