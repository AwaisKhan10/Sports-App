import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/ui/screens/notification/notification_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationViewModel(),
      child: Consumer<NotificationViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: scaffoldColor,

            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDropDownExpendableButton(
                    text:
                        'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.notifications.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CustomNotificationCard(
                        notification: model.notifications[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
