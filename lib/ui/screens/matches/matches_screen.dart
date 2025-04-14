import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/ui/screens/matches/matches_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/shimmer/matches_shimmer.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MatchesViewModel()..loadMatches(),
      child: Consumer<MatchesViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              progressIndicator: MatchesShimmer(),
              child: Scaffold(
                backgroundColor: scaffoldColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CustomDropDownExpendableButton(
                            text:
                                'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                          ),
                        ),
                        10.verticalSpace,
                        Text('Matches', style: style20B),

                        if (model.matches.isEmpty)
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
      ),
    );
  }

  Widget _UpComingShow(Matches match) {
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
                      DateFormat(
                        'EEEE, MMMM d, yyyy',
                      ).format(DateTime.parse(match.matchDate)),
                      style: style16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Away',
                        style: style14.copyWith(color: whiteColor),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// Home Team Side
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          match.homeLogo,
                          height: 50.h,
                          width: 50.w,
                        ),
                        8.horizontalSpace,
                        Text(match.homeTeam, style: style16B),
                      ],
                    ),

                    /// Away Team Side
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          match.awayLogo,
                          height: 50.h,
                          width: 50.w,
                        ),
                        8.horizontalSpace,
                        Text(match.awayTeam, style: style16B),
                      ],
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat(
                        'h:mm a',
                      ).format(DateTime.parse(match.matchDate)),
                      style: style16.copyWith(fontWeight: FontWeight.w600),
                    ),
                    5.horizontalSpace,
                    Container(
                      height: 18,
                      width: 1.5,
                      color: Colors.grey,
                      margin: EdgeInsets.only(bottom: 4),
                    ),
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
