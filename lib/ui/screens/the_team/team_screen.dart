// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:sports_app/core/constant/colors.dart';
// import 'package:sports_app/ui/screens/the_team/player_profile.dart';
// import 'package:sports_app/ui/screens/the_team/the_team_view_model.dart';
// import 'package:sports_app/widget/drop_down_expendable_button.dart';
// import 'package:sports_app/widget/team_player_card_for_name_tab.dart';
// import 'package:sports_app/widget/team_player_card_position_tab.dart';

// class TheTeamScreen extends StatefulWidget {
//   const TheTeamScreen({Key? key}) : super(key: key);

//   @override
//   State<TheTeamScreen> createState() => _TheTeamScreenState();
// }

// class _TheTeamScreenState extends State<TheTeamScreen> {
//   @override
//   Widget build(BuildContext context) {
//     bool isselected = false;
//     setState(() {
//       isselected = !isselected;
//     });
//     return ChangeNotifierProvider(
//       create: (context) => TheTeamViewModel(),
//       child: Consumer<TheTeamViewModel>(
//         builder: (context, model, child) {
//           return DefaultTabController(
//             length: 3,
//             child: Scaffold(
//               backgroundColor: scaffoldColor,

//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   children: [
//                     CustomDropDownExpendableButton(
//                       text:
//                           'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
//                     ),
//                     30.verticalSpace,
//                     TabBar(
//                       indicatorColor: whiteColor,
//                       labelColor: whiteColor, // Selected tab color
//                       unselectedLabelColor: blackColor, // Unselected tab color
//                       tabAlignment: TabAlignment.start,
//                       dividerHeight: 0.0,
//                       indicatorAnimation: TabIndicatorAnimation.linear,
//                       indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: secondaryColor,
//                       ),
//                       isScrollable: true,

//                       tabs: const [
//                         Tab(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 40),
//                             child: Text('Name'),
//                           ),
//                         ),
//                         Tab(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 30),
//                             child: Text('Position'),
//                           ),
//                         ),
//                         Tab(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 30),
//                             child: Text('Number'),
//                           ),
//                         ),
//                       ],
//                     ),

//                     Expanded(
//                       child: TabBarView(
//                         children: [
//                           _buildPlayerListOfName(model.playersList),
//                           _buildPlayerListOfPositionTab(model.playersList),
//                           _buildPlayerListOfNumberTab(model.playersList),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   ///
//   ///     for name tab
//   ///
//   Widget _buildPlayerListOfName(List players) {
//     return ListView.builder(
//       padding: EdgeInsets.all(10),
//       itemCount: players.length,
//       itemBuilder: (context, index) {
//         return CustomTeamPlayerNameCard(
//           player: players[index],
//           onTap: () {
//             Get.to(() => PlayerProfileScreen(player: players[index]));
//           },
//         );
//       },
//     );
//   }

//   ///
//   ///     for position tab
//   ///
//   Widget _buildPlayerListOfPositionTab(List players) {
//     return ListView.builder(
//       padding: EdgeInsets.all(10),
//       itemCount: players.length,
//       itemBuilder: (context, index) {
//         return CustomTeamPlayerPositionCard(
//           player: players[index],
//           onTap: () {
//             Get.to(() => PlayerProfileScreen(player: players[index]));
//           },
//         );
//       },
//     );
//   }

//   ///
//   ///     for mixed tab (Name + Position)
//   ///
//   Widget _buildPlayerListOfNumberTab(List players) {
//     return ListView.builder(
//       padding: EdgeInsets.all(10),
//       itemCount: players.length,
//       itemBuilder: (context, index) {
//         if (index % 2 == 0) {
//           // Even index → Show Name Card
//           return CustomTeamPlayerNameCard(
//             player: players[index ~/ 2],
//             onTap: () {
//               Get.to(() => PlayerProfileScreen(player: players[index ~/ 2]));
//             },
//           );
//         } else {
//           // Odd index → Show Position Card
//           return CustomTeamPlayerPositionCard(
//             player: players[index ~/ 2],
//             onTap: () {
//               Get.to(() => PlayerProfileScreen(player: players[index ~/ 2]));
//             },
//           );
//         }
//       },
//     );
//   }
// }
