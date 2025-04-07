class EndPoints {
  static const String baseUrl =
      "https://safaoverberg.co.za/backend/portal/api/";

  // User API endpoints
  static const String userApi = "${baseUrl}user_api.php";
  static const String register = "$userApi?action=register";
  static const String login = "$userApi?action=login";
  static const String updateProfile = "$userApi?action=update_profile";
  static const String forgotPassword = "$userApi?action=forgot_password";
  static const String socialLogin = "$userApi?action=social_login";

  // Extended API endpoints
  static const String extendedApi = "${baseUrl}extended_api.php";
  static const String allPosts = "$extendedApi?action=all_posts";
  static const String getMatches = "$extendedApi?action=get_matches";
  static const String commentPost = "$extendedApi?action=comment_post";

  // Team API endpoints
  static const String teamApi = "${baseUrl}teams_api.php?action=get_teams";
}
