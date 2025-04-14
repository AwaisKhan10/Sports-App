import 'package:flutter/material.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/ui/screens/new_feeds/new_feeds_screen.dart'
    show NewFeedScreen;
import 'package:sports_app/ui/screens/%20%20ticketing/%20%20ticketing_screen.dart';
import 'package:sports_app/ui/screens/%20Info_support/%20Info_support_screen.dart';
import 'package:sports_app/ui/screens/%20merchandise/%20merchandise_screen.dart';
import 'package:sports_app/ui/screens/MLS_matchday/MLS_match_day.dart';
import 'package:sports_app/ui/screens/concession/concession_screen.dart';
import 'package:sports_app/ui/screens/fan_engagement/fan_engegement_screen.dart';

import 'package:sports_app/ui/screens/home/home_screen.dart';
import 'package:sports_app/ui/screens/notification/notification_screen.dart';
import 'package:sports_app/ui/screens/parking/parking_screen.dart';
import 'package:sports_app/ui/screens/matches/matches_screen.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_info_screen.dart';
import 'package:sports_app/ui/screens/the_team/teams/teams_screen.dart';

class DrawerScreenViewModel extends ChangeNotifier {
  int _selectedIndex = 0; // Default screen index

  final authservices = locator<AuthService>();

  final List<String> screenNames = [
    "Home",
    "News Feed",
    "Ticketing",
    "Parking",
    "Matches",
    "Teams",
    "Notification",
    "Fan Engagement",
    "Stadium Information",
    "Merchandise",
    "Concession",
    "MLS Matchday",
    "Info/Support",
  ];

  final List<Widget> screens = [
    HomeScreen(),
    NewFeedScreen(),
    TicketingScreen(),
    ParkingScreen(),
    MatchesScreen(),
    TeamScreen(),
    NotificationScreen(),
    NewFeedScreen(),
    StadiumInformationScreen(),
    MerchandiseScreen(),
    ConcessionScreen(),
    MLSmatchday(),
    InfoSupportScreen(),
  ];

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => screens[_selectedIndex];
  String get currentScreenName => screenNames[_selectedIndex];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
