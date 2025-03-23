// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:sports_app/core/constant/colors.dart';
// import 'package:sports_app/ui/screens/the_team/team_view_model.dart';
// import 'package:sports_app/widget/drop_down_expendable_button.dart';

// class TheTeamScreen extends StatelessWidget {
//   const TheTeamScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TeamViewModel(),
//       child: Consumer<TeamViewModel>(
//         builder: (context, model, child) {
//           return Scaffold(
//             backgroundColor: scaffoldColor,
//             appBar: AppBar(backgroundColor: whiteColor),
//             body: Column(
//               children: [
//                 CustomDropDownExpendableButton(
//                   text:
//                       'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
//                 ),
//                 20.verticalSpace,
//                 AppBar()
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/the_team/team_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/team_player_card.dart';

class TheTeamScreen extends StatelessWidget {
  const TheTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel(),
      child: DefaultTabController(
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
                20.verticalSpace,
                // TabBar(
                //   labelColor: Colors.white,
                //   unselectedLabelColor: Colors.black,
                //   indicator: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   tabs: [
                //     Tab(text: "Name"),
                //     Tab(text: "Position"),
                //     Tab(text: "Number"),
                //   ],
                // ),
                TabBar(
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
                          padding: EdgeInsets.symmetric(horizontal: 30),
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
                          style: style16.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Number',
                          style: style16.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Consumer<TeamViewModel>(
                    builder: (context, viewModel, child) {
                      return TabBarView(
                        children: [
                          _buildPlayerList(viewModel.playersList),
                          _buildPlayerList(viewModel.playersList),
                          _buildPlayerList(viewModel.playersList),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerList(List players) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return CustomTeamPlayerCard(player: players[index]);
      },
    );
  }
}
