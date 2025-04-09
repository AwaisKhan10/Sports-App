import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class GuestServicesScreen extends StatelessWidget {
  const GuestServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: 'Guest Services'),
      ),

      ///
      /// Start Body
      ///
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.verticalSpace,
            _services('Need Help? Need Information? Visit Guest Service'),
            20.verticalSpace,
            _services('Guest Service is Located Near section 101'),
            20.verticalSpace,
            _services('Don’t need to be see us in person?'),
            20.verticalSpace,
            _services('Planing Ahead for Your Quick Exit'),
            20.verticalSpace,
            Text(
              'Send a text message to guest services. Please \n include your section and now number. Available for\n games and events at Avaya Stadium only',
              style: style16.copyWith(fontWeight: FontWeight.w500),
            ),
            20.verticalSpace,
            CustomTicketCard(
              onTap: () {},
              ticketObject: TicketScreenModel(
                imageUrl: AppAssets().contact,
                title: 'Text Guest',
                subTitle: 'Services',
              ),
            ),
            20.verticalSpace,
            Text('*Standard SMS or damay apply', style: style16),
          ],
        ),
      ),
    );
  }

  Widget _services(String title) {
    return Container(
      width: double.infinity,
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Text(title, style: style16),
      ),
    );
  }
}
