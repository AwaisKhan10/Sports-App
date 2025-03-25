import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/ui/screens/%20%20ticketing/ticketing_view_model.dart';
import 'package:sports_app/ui/screens/purchase_ticket/purchase_ticket_screen.dart';
import 'package:sports_app/ui/screens/seating_diagram.dart/seating_diagram.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/main_tickt_screen_card.dart';

class TicketingScreen extends StatelessWidget {
  const TicketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TicketingViewModel(),
      child: Consumer<TicketingViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
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
                            Get.to(() => PurchaseTicketScreen());
                          },
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().purchase,
                            title: 'Purchase',
                            subTitle: 'Tickets',
                          ),
                        ),
                        CustomTicketCard(
                          ticketObject: TicketScreenModel(
                            imageUrl: AppAssets().ticket,
                            title: 'My',
                            subTitle: 'Tickets',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('$SeatingDiagramScreen');
                            Get.to(() => SeatingDiagramScreen());
                          },
                          child: CustomTicketCard(
                            ticketObject: TicketScreenModel(
                              imageUrl: AppAssets().seats,
                              title: 'Seating',
                              subTitle: 'Diagram',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showCallDialog(context);
                          },
                          child: CustomTicketCard(
                            ticketObject: TicketScreenModel(
                              imageUrl: AppAssets().contact,
                              title: 'Contact',
                              subTitle: 'Ticket Help',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Tickets secured by', style: style16B),

                // Row(children: [   Text('Tickets secured by', style: style16),
                //  Text('Tickets secured by', style: style16),],)
                Image.asset(AppAssets().tickText, scale: 4), 60.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  ///
  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "+27 083 816 4339",
                style: style20.copyWith(
                  color: secondaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: style18.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your call functionality here
                    },
                    child: Text(
                      "Call",
                      style: style18.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
