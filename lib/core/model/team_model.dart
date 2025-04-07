class TeamModel {
  final int teamId;
  final String teamName;
  final String logo;
  final String teamLogo;

  TeamModel({
    required this.teamId,
    required this.teamName,
    required this.logo,
    required this.teamLogo,
  });

  // Factory constructor to create a TeamModel from a JSON response
  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      teamId: json['team_id'],
      teamName: json['team_name'],
      logo: json['logo'] ?? '',
      teamLogo: json['team_logo'],
    );
  }

  // Method to convert TeamModel to a Map (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'team_id': teamId,
      'team_name': teamName,
      'logo': logo,
      'team_logo': teamLogo,
    };
  }
}
