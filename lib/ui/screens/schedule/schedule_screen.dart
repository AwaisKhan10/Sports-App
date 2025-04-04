import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/schedule/schedule_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScheduleViewModel()..loadMatches(),
      child: Consumer<ScheduleViewModel>(
        builder:
            (context, model, _) => Scaffold(
              backgroundColor: scaffoldColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomDropDownExpendableButton(
                          text:
                              'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                        ),
                      ),
                      Text('Show upcoming', style: style18),
                      20.verticalSpace,
                      if (model.isLoading)
                        Center(child: CircularProgressIndicator())
                      else if (model.error != null)
                        Center(
                          child: Column(
                            children: [
                              Text(
                                model.error!,
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: model.loadMatches,
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      else if (model.matches.isEmpty)
                        Center(
                          child: Text('No upcoming matches', style: style18),
                        )
                      else
                        ...model.matches.map((match) => _UpComingShow(match)),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _UpComingShow(match) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d, yyyy').format(match.matchDate),
                      style: style16,
                    ),
                    Container(
                      height: 35.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Match',
                          style: style16.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        match.homeTeam,
                        style: style18.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'VS',
                        style: style16B.copyWith(color: primaryColor),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        match.awayTeam,
                        style: style18.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      DateFormat('h:mm a').format(match.matchDate),
                      style: style16B,
                    ),
                    5.horizontalSpace,
                    Container(height: 16, width: 1.5, color: Colors.grey),
                    5.horizontalSpace,
                    Text(
                      match.venue,
                      style: style16.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
