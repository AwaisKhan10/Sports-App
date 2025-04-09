// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/the_team/the_team_screen.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'team_view_model.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamViewModel()..fetchTeams(),
      child: Scaffold(
        body: Consumer<TeamViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage.isNotEmpty) {
              return Center(child: Text(viewModel.errorMessage));
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomDropDownExpendableButton(
                  text:
                      'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                ),
                16.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.teams.length,
                  itemBuilder: (context, index) {
                    final team = viewModel.teams[index];
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),

                      child: ListTile(
                        leading:
                            team.teamLogo.isNotEmpty
                                ? CachedNetworkImage(
                                  imageUrl: team.teamLogo,
                                  width: 60.w,
                                  height: 60.h,
                                  placeholder:
                                      (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          color: primaryColor,
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                          Icon(Icons.person),
                                )
                                : Icon(Icons.person),
                        title: Text(team.teamName, style: style18),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => TheTeamScreen(
                                    teamId: team.teamId,
                                    teamName: team.teamName,
                                  ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStaffList(List<TeamStaffModel> staffList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: staffList.length,
      itemBuilder: (context, index) {
        final staff = staffList[index];
        return ListTile(
          leading: CircleAvatar(
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: staff.profileImage,
                fit: BoxFit.cover,
                width: 40.r,
                height: 40.r,
                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                errorWidget:
                    (context, url, error) => Icon(Icons.person, size: 20.r),
              ),
            ),
          ),
          title: Text(staff.name),
          subtitle: Text(staff.position),
        );
      },
    );
  }
}
