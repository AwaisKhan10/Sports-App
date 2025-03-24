import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            appBar: AppBar(backgroundColor: whiteColor),
            body: Column(
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'qwertyuioplkjhgfdazxcvbnm,klpoiuytrewqazxcvbnmklkjhgfdsaqwertyuiopkmnbvcxsawertyuioplkjhgfdsazxcvbnm,lpoiuytrewqasdfghjkl,mnbvcxza',
                ),
                ListView.builder(
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
          );
        },
      ),
    );
  }
}
