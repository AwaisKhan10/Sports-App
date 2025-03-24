import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/ui/screens/fan_engagement/fan_engagement_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';

class FanEngagementScreen extends StatelessWidget {
  const FanEngagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FanEngagementViewModel(),
      child: Consumer<FanEngagementViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: scaffoldColor,
            appBar: AppBar(backgroundColor: whiteColor),
            body: Column(
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'This exciting area gives you a chance to be part of \n activities going on around the stadium. Start by \n tapping the button below and posting a photo to the \n Fan Engagement Wall. More coming soon!',
                ),
                Center(
                  child: Text('Fan Engagement UI will be created in last '),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
