import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';
import 'package:sports_app/ui/screens/new_feeds/new_feeds_screen.dart'
    show NewFeedScreen;
import 'package:sports_app/ui/screens/%20%20ticketing/%20%20ticketing_screen.dart';
import 'package:sports_app/ui/screens/%20Info_support/%20Info_support_screen.dart';
import 'package:sports_app/ui/screens/%20merchandise/%20merchandise_screen.dart';
import 'package:sports_app/ui/screens/MLS_matchday/MLS_match_day.dart';
import 'package:sports_app/ui/screens/concession/concession_screen.dart';
import 'package:sports_app/ui/screens/home/home_screen.dart';
import 'package:sports_app/ui/screens/notification/notification_screen.dart';
import 'package:sports_app/ui/screens/parking/parking_screen.dart';
import 'package:sports_app/ui/screens/matches/matches_screen.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_info_screen.dart';
import 'package:sports_app/ui/screens/the_team/teams/teams_screen.dart';

class DrawerScreenViewModel extends BaseViewModel {
  int _selectedIndex = 0; // Default screen index

  final authservices = locator<AuthService>();

  final List<String> screenNames = [
    "Home",
    "News Feed",
    "Ticketing",
    // "Parking",
    "Matches",
    "Teams",
    "Notification",
    "Fan Engagement",
    // "Stadium Information",
    "Merchandise",
    // "Concession",
    // "MLS Matchday",
    "Info/Support",
  ];

  final List<Widget> screens = [
    HomeScreen(),
    NewFeedScreen(),
    TicketingScreen(),
    // ParkingScreen(),
    MatchesScreen(),
    TeamScreen(),
    NotificationScreen(),
    NewFeedScreen(),
    // StadiumInformationScreen(),
    MerchandiseScreen(),
    // ConcessionScreen(),
    // MLSmatchday(),
    InfoSupportScreen(),
  ];

  Future<void> logoutUser(BuildContext context) async {
    setState(ViewState.busy);
    try {
      await authservices.logout();
      Get.snackbar("Success", "Logged out successfully");
      Get.offAll(SignInScreen());
    } catch (e) {
      print("Logout failed: $e");
    } finally {
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => screens[_selectedIndex];
  String get currentScreenName => screenNames[_selectedIndex];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
