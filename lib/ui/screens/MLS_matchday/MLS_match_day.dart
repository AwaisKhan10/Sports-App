import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class MLSmatchday extends StatelessWidget {
  const MLSmatchday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: Column(
        children: [
          Stack(
            children: [
              Row(
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
              Center(
                child: CustomDropDownExpendableButton(
                  text:
                      'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                ),
              ),
            ],
          ),
          40.verticalSpace,
          Text('MLS Matchday', style: style25),
          Text(
            textAlign: TextAlign.center,
            'The offical app of Major Leage Soccer keeps you\n connected with the latest news, highlights,\n standings, and analysis all for FREE.\n\n *Live scores every offical MLS match, CONCACAF \nChampions League and many international matches\n\n *Free highlight videos and clips during games',
          ),
          60.verticalSpace,
          CustomTicketCard(
            onTap: () {
              print('Downloading.....');
            },
            ticketObject: TicketScreenModel(
              imageUrl: AppAssets().downloadIcon,
              title: ' Download Now',
              // subTitle: '',
            ),
          ),
        ],
      ),
    );
  }
}
