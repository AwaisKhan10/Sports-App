import 'package:get/get.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/scroll_view.dart';
import 'package:sports_app/core/model/scroll_view_show_upcoming.dart';

class ScrollViewViewModel extends GetxController {
  var tweets = <TweetModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTweets();
  }

  void fetchTweets() {
    tweets.value = [
      TweetModel(
        username: "San Jose Earthquakes",
        handle: "@sanjoseteam",
        timeAgo: "34min ago",
        content:
            "RT @opencup: EXCLU VIDEO PREVIEW of 2nite's #USOC2017 Semi @SportingKC v OSJEarthquakes. #quakes74 #SportingKC1",
        imageUrl: AppAssets().dp,
        link: "https://t.co/example",
      ),
      TweetModel(
        username: "San Jose Earthquakes",
        handle: "@sanjoseteam",
        timeAgo: "34min ago",
        content:
            "RT @opencup: EXCLU VIDEO PREVIEW of 2nite's #USOC2017 Semi @SportingKC v OSJEarthquakes. #quakes74 #SportingKC1",
        imageUrl: "assets/quakes_logo.png", // Example image
        link: "https://t.co/example",
      ),
      TweetModel(
        username: "San Jose Earthquakes",
        handle: "@sanjoseteam",
        timeAgo: "34min ago",
        content:
            "RT @opencup: EXCLU VIDEO PREVIEW of 2nite's #USOC2017 Semi @SportingKC v OSJEarthquakes. #quakes74 #SportingKC1",
        imageUrl: "assets/quakes_logo.png", // Example image
        link: "https://t.co/example",
      ),
    ];
  }

  ///////////////////
  //   show upcoming
  //
  List<ShowUpcomingModel> showUpcomings = [
    ShowUpcomingModel(imageUrl: AppAssets().dp, name: 'San Jose Earthquakes'),
    ShowUpcomingModel(imageUrl: AppAssets().dp, name: 'San Jose Earthquakes'),
  ];
}
