// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/ui/screens/the_team/player_profile.dart';
import 'package:sports_app/ui/screens/the_team/the_team_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/team_player_card_for_name_tab.dart';
import 'package:sports_app/widget/team_player_card_position_tab.dart';

class TheTeamScreen extends StatefulWidget {
  final int teamId;
  final String teamName;

  const TheTeamScreen({Key? key, required this.teamId, required this.teamName})
    : super(key: key);

  @override
  State<TheTeamScreen> createState() => _TheTeamScreenState();
}

class _TheTeamScreenState extends State<TheTeamScreen> {
  late TheTeamViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = TheTeamViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTeamPlayers(widget.teamId);
      viewModel.fetchStaffMembers(widget.teamId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<TheTeamViewModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: scaffoldColor,
              appBar: AppBar(
                title: Text(widget.teamName),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: scaffoldColor,
                surfaceTintColor: scaffoldColor,
              ),
              body:
                  model.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : model.errorMessage.isNotEmpty
                      ? Center(child: Text(model.errorMessage))
                      : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            CustomDropDownExpendableButton(
                              text:
                                  'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                            ),
                            30.verticalSpace,
                            TabBar(
                              indicatorColor: whiteColor,
                              labelColor: whiteColor,
                              unselectedLabelColor: blackColor,
                              tabAlignment: TabAlignment.start,
                              dividerHeight: 0.0,
                              indicatorAnimation: TabIndicatorAnimation.linear,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: secondaryColor,
                              ),
                              isScrollable: true,
                              tabs: const [
                                Tab(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                    ),
                                    child: Text('Name'),
                                  ),
                                ),
                                Tab(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Text('Position'),
                                  ),
                                ),
                                // Tab(
                                //   child: Padding(
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 30,
                                //     ),
                                //     child: Text('Number'),
                                //   ),
                                // ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  _buildPlayerListOfName(model.playersList),
                                  _buildPlayerListOfPositionTab(
                                    model.staffList,
                                  ),
                                  // _buildPlayerListOfNumberTab(
                                  //   model.playersList,
                                  // ),
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
  Widget _buildPlayerListOfName(List<TeamPlayerModel> players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerNameCard(
          player: players[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PlayerProfileScreen(player: players[index]),
              ),
            );
          },
        );
      },
    );
  }

  ///
  ///     for position tab
  ///
  Widget _buildPlayerListOfPositionTab(List<TeamStaffModel> staff) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: staff.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerPositionCard(
          player: staff[index],
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder:
            //         (context) => PlayerProfileScreen(player: staff[index]),
            //   ),
            // );
          },
        );
      },
    );
  }

  ///
  ///     for mixed tab (Name + Position)
  ///
  Widget _buildPlayerListOfNumberTab(List<TeamPlayerModel> players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerNameCard(
          player: players[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PlayerProfileScreen(player: players[index]),
              ),
            );
          },
        );
      },
    );
  }
}
