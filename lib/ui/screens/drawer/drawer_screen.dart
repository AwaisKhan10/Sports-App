// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';
import 'package:sports_app/ui/screens/drawer/drawer_view_model.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrawerScreenViewModel(),
      child: Consumer<DrawerScreenViewModel>(
        builder: (context, model, child) {
          print("name: ${model.authservices.appUser.toJson()}");
          return Scaffold(
            backgroundColor: scaffoldColor,
            appBar: AppBar(
              toolbarHeight: 60.h,
              centerTitle: true,
              title: Text(model.currentScreenName, style: style20B),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shadowColor: scaffoldColor,
              surfaceTintColor: scaffoldColor,
            ),
            drawer: CustomDrawer(authServices: model.authservices),
            body: model.currentScreen,
          );
        },
      ),
    );
  }
}

// custom drawer
class CustomDrawer extends StatelessWidget {
  final AuthService authServices;
  const CustomDrawer({required this.authServices});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black, // Black background
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          20.verticalSpace,
          // **User Profile Section**
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              ListTile(
                leading: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.grey[400], // Placeholder color
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
                title: Text(
                  "Hello ${authServices.appUser.firstName}",
                  style: style20.copyWith(color: Colors.white, fontSize: 18),
                ),

                subtitle: SizedBox(
                  width: 30.w,
                  height: 35.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => SignInScreen());
                    },
                    child: Text(
                      "Login",
                      style: style16.copyWith(color: whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // **Drawer Menu Items**
          _buildDrawerItem(context, 0, AppAssets().home, 'Home'),
          _buildDrawerItem(context, 1, AppAssets().scrollView, 'News Feed'),
          _buildDrawerItem(context, 2, AppAssets().ticket, 'Ticketing'),
          _buildDrawerItem(context, 3, AppAssets().parking, 'Parking'),
          _buildDrawerItem(context, 4, AppAssets().schedule, 'Matches'),

          _buildDrawerItem(context, 5, AppAssets().team, 'Teams'),
          _buildDrawerItem(
            context,
            6,
            AppAssets().notification,
            'Notification',
          ),
          _buildDrawerItem(context, 7, AppAssets().fan, 'Fan Engagement'),
          _buildDrawerItem(
            context,
            8,
            AppAssets().info_stadium,
            'Stadium information',
          ),
          _buildDrawerItem(context, 9, AppAssets().merchandise, 'Merchandise'),
          _buildDrawerItem(context, 10, AppAssets().concessions, 'Concession'),
          _buildDrawerItem(context, 11, AppAssets().mls, 'MLS Matchday'),
          _buildDrawerItem(
            context,
            12,
            AppAssets().info_stadium,
            'info/support',
          ),

          ///**************    old     ***************/

          // _buildDrawerItem(AppAssets().concessions, "Concessions"),
          // _buildDrawerItem(AppAssets().mls, "MLS Matchday"),
          // _buildDrawerItem(AppAssets().info_stadium, "Info/Support"),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    int index,
    String imageUrl,
    String title,
  ) {
    return ListTile(
      leading: Container(
        height: 33.h,
        width: 35.w,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            scale: 4,
          ), // Image added
        ),
      ),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Provider.of<DrawerScreenViewModel>(
          context,
          listen: false,
        ).updateIndex(index);
        Navigator.pop(context); // Close drawer after selecting
      },
    );
  }
}
