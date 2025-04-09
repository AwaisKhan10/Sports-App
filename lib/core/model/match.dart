class Matches {
  final String matchId;
  final String homeTeam;
  final String homeLogo;
  final String awayTeam;
  final String awayLogo;
  final String matchDate;
  final String venue;

  Matches({
    required this.matchId,
    required this.homeTeam,
    required this.homeLogo,
    required this.awayTeam,
    required this.awayLogo,
    required this.matchDate,
    required this.venue,
  });

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      matchId: json['match_id'] ?? '',
      homeTeam: json['home_team'] ?? '',
      homeLogo: json['home_logo'] ?? '',
      awayTeam: json['away_team'] ?? '',
      awayLogo: json['away_logo'] ?? '',
      matchDate: json['match_date'] ?? '',
      venue: json['venue'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'match_id': matchId,
      'home_team': homeTeam,
      'home_logo': homeLogo,
      'away_team': awayTeam,
      'away_logo': awayLogo,
      'match_date': matchDate,
      'venue': venue,
    };
  }
}
