import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/notifcation.dart';

class NotificationViewModel extends ChangeNotifier {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      imageUrl: AppAssets().dp,
      title: "Game day and More Excitement \ncomming!",
      day: "Wednesday",
      month: "August",
      date: 9,
      year: 2024,
      description:
          "It's game day and more excitement on the way, so let’s enjoy this...",
    ),
    NotificationModel(
      imageUrl: AppAssets().dp,
      title: "Game day and More Excitement \ncomming!",
      day: "Saturday",
      month: "September",
      date: 15,
      year: 2024,
      description: "Get ready for an amazing soccer match with top teams!",
    ),
    NotificationModel(
      imageUrl: AppAssets().dp,
      title: "Game day and More Excitement \ncomming!",
      day: "Wednesday",
      month: "August",
      date: 9,
      year: 2024,
      description:
          "It's game day and more excitement on the way, so let’s enjoy this...",
    ),
    NotificationModel(
      imageUrl: AppAssets().dp,
      title: "Game day and More Excitement \ncomming!",
      day: "Saturday",
      month: "September",
      date: 15,
      year: 2024,
      description: "Get ready for an amazing soccer match with top teams!",
    ),
  ];

  List<NotificationModel> get notifications => _notifications;

  void addNotification(NotificationModel notification) {
    _notifications.add(notification);
    notifyListeners();
  }
}
