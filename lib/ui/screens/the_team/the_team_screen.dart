// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/ui/screens/the_team/player_profile.dart';
import 'package:sports_app/ui/screens/the_team/the_team_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/shimmer/players_shimmer.dart';
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

class _TheTeamScreenState extends State<TheTeamScreen>
    with SingleTickerProviderStateMixin {
  late TheTeamViewModel viewModel;
  TabController? _tabController; // TabController to manage tab changes

  @override
  void initState() {
    super.initState();
    viewModel = TheTeamViewModel();

    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchTeamPlayers(widget.teamId);
      viewModel.fetchStaffMembers(widget.teamId);
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<TheTeamViewModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: scaffoldColor,
              appBar: AppBar(
                title: Text(widget.teamName, style: style18B),
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: scaffoldColor,
                surfaceTintColor: scaffoldColor,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CustomDropDownExpendableButton(
                      text:
                          'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                    ),
                    30.verticalSpace,
                    TabBar(
                      controller: _tabController, // Set the TabController here
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
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text('Name'),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text('Position'),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller:
                            _tabController, // Set the TabController here
                        children: [
                          _buildPlayerListOfName(model.playersList, model),
                          _buildPlayerListOfPositionTab(model.staffList, model),
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

  Widget _buildPlayerListOfName(
    List<TeamPlayerModel> players,
    TheTeamViewModel model,
  ) {
    // Only show shimmer for the Name tab if model is busy
    if (_tabController!.index == 0 && model.state == ViewState.busy) {
      return _buildShimmerEffect();
    }

    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerNameCard(
          player: players[index],
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PlayerProfileScreen(player: players[index]),
              ),
            );
            // refresh after return
          },
        );
      },
    );
  }

  Widget _buildPlayerListOfPositionTab(
    List<TeamStaffModel> staff,
    TheTeamViewModel model,
  ) {
    // Only show shimmer for the Position tab if model is busy
    if (_tabController!.index == 1 && model.state == ViewState.busy) {
      return _buildShimmerEffect();
    }

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
            //         (context) => PlayerProfileScreen(
            //           player: staff[index],
            //           viewModel: model,
            //         ),
            //   ),
            // );
          },
        );
      },
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount:
          10, // Adjust to the expected number of items you want to show in shimmer
      itemBuilder: (context, index) {
        return CustomTeamPlayerShimmer(
          player:
              TeamPlayerModel(), // Pass a dummy player model or leave it empty
          onTap: () {},
        );
      },
    );
  }
}
