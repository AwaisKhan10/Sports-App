import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/purchase_tickets.dart';

class PurchaseTicketViewModel extends ChangeNotifier {
  List<PurchaseTicketModel> matches = [
    PurchaseTicketModel(
      date: '16',
      month: 'Aug',
      day: 'sun',
      team1: 'San Jose Earthquakes',
      team2: 'Philadelphia Uni',
      time: '7:15 PM',
      venue: 'Avaya Stadium',
      location: 'San Jose, CA',
      team1Logo: AppAssets().dp,
      // team2Logo: 'assets/philadelphia_logo.png',
    ),
    PurchaseTicketModel(
      date: '16',
      month: 'Aug',
      day: 'sun',
      team1: 'San Jose Earthquakes',
      team2: 'Philadelphia Uni',
      time: '7:15 PM',
      venue: 'Avaya Stadium',
      location: 'San Jose, CA',
      team1Logo: AppAssets().dp,
      // team2Logo: 'assets/philadelphia_logo.png',
    ),
    PurchaseTicketModel(
      date: '16',
      month: 'Aug',
      day: 'sun',
      team1: 'San Jose Earthquakes',
      team2: 'Philadelphia Uni',
      time: '7:15 PM',
      venue: 'Avaya Stadium',
      location: 'San Jose, CA',
      team1Logo: AppAssets().dp,
      // team2Logo: 'assets/philadelphia_logo.png',
    ),
    PurchaseTicketModel(
      date: '16',
      month: 'Aug',
      day: 'sun',
      team1: 'San Jose Earthquakes',
      team2: 'Philadelphia Uni',
      time: '7:15 PM',
      venue: 'Avaya Stadium',
      location: 'San Jose, CA',
      team1Logo: AppAssets().dp,
      // team2Logo: 'assets/philadelphia_logo.png',
    ),
  ];
}
