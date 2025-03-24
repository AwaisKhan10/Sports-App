import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/the_team/player_profile.dart';
import 'package:sports_app/ui/screens/the_team/team_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/team_player_card_for_name_tab.dart';
import 'package:sports_app/widget/team_player_card_position_tab.dart';

class TheTeamScreen extends StatelessWidget {
  const TheTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel(),
      child: Consumer<TeamViewModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: scaffoldColor,
              appBar: AppBar(backgroundColor: whiteColor),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    CustomDropDownExpendableButton(
                      text: 'qwertyuiopl,mnbvcxzasdfghjkl',
                    ),
                    30.verticalSpace,
                    TabBar(
                      indicatorColor: whiteColor,
                      labelColor: whiteColor,
                      unselectedLabelColor: blackColor,
                      tabAlignment: TabAlignment.start,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondaryColor,
                      ),
                      isScrollable: true,
                      tabs: [
                        SizedBox(
                          height: 35.h,

                          child: Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Name',
                                style: style16.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Position',
                              style: style16.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Number',
                              style: style16.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildPlayerListOfName(model.playersList),
                          _buildPlayerListOfPositionTab(model.playersList),
                          _buildPlayerListOfNumberTab(model.playersList),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///     for name tab
  ///
  Widget _buildPlayerListOfName(List players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerNameCard(
          player: players[index],
          onTap: () {
            Get.to(PlayerProfileScreen());
          },
        );
      },
    );
  }

  ///
  ///     for position tab
  ///
  Widget _buildPlayerListOfPositionTab(List players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerPositionCard(
          player: players[index],
          onTap: () {
            Get.to(PlayerProfileScreen());
          },
        );
      },
    );
  }

  ///
  ///     for mixed tab (Name + Position)
  ///
  Widget _buildPlayerListOfNumberTab(List players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          // Even index → Show Name Card
          return CustomTeamPlayerNameCard(
            player: players[index ~/ 2],
            onTap: () {
              Get.to(PlayerProfileScreen());
            },
          );
        } else {
          // Odd index → Show Position Card
          return CustomTeamPlayerPositionCard(
            player: players[index ~/ 2],
            onTap: () {
              Get.to(PlayerProfileScreen());
            },
          );
        }
      },
    );
  }
}
