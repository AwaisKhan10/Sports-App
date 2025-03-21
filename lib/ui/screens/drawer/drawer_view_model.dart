import 'package:flutter/material.dart';
import 'package:sports_app/ui/screens/%20%20scroll_view/%20%20scroll_view_screen.dart'
    show ScrollViewScreen;
import 'package:sports_app/ui/screens/%20%20ticketing/%20%20ticketing_screen.dart';
import 'package:sports_app/ui/screens/%20Info_support/%20Info_support_screen.dart';
import 'package:sports_app/ui/screens/%20merchandise/%20merchandise_screen.dart';
import 'package:sports_app/ui/screens/MLS_matchday/MLS_match_day.dart';
import 'package:sports_app/ui/screens/concession/concession_screen.dart';
import 'package:sports_app/ui/screens/fan_engagement/fan_engegement_screen.dart';

import 'package:sports_app/ui/screens/home/home_screen.dart';
import 'package:sports_app/ui/screens/notification/notification_screen.dart';
import 'package:sports_app/ui/screens/parking/parking_screen.dart';
import 'package:sports_app/ui/screens/schedule/schedule_screen.dart';
import 'package:sports_app/ui/screens/stadium_information/stadium_info_screen.dart';
import 'package:sports_app/ui/screens/the_team/the_team_screen.dart';

class DrawerScreenViewModel extends ChangeNotifier {
  int _selectedIndex = 0; // Default screen index

  final List<Widget> screens = [
    HomeScreen(), // Home
    ScrollViewScreen(), // Scroll View
    TicketingScreen(), // Ticketing
    ParkingScreen(), // Home
    ScheduleScreen(), // Scroll View
    TheTeamScreen(), // Ticketing
    NotificationScreen(), // Home
    FanEngagementScreen(), // Scroll View
    StadiumInformationScreen(), // Ticketing  SignInScreen(), // Home
    MerchandiseScreen(), // Scroll View
    ConcessionScreen(), // Ticketing
    MLSmatchday(), // Home
    InfoSupportScreen(), // Scroll View
  ];

  int get selectedIndex => _selectedIndex;
  Widget get currentScreen => screens[_selectedIndex]; // Get selected screen

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notify UI of the change
  }
}
