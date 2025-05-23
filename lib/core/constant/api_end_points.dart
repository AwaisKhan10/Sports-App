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
  static const String likePost = "$extendedApi?action=like_post";
  static const String unlikePost = "$extendedApi?action=unlike_post";
  // Team API endpoints
  static const String teamApi = "${baseUrl}teams_api.php";
  static const String getTeams = "$teamApi?action=get_teams";
  static const String getTeamPlayers = "$teamApi?action=get_team_players";
  static const String getTeamStaff = "$teamApi?action=get_team_staff";
}
