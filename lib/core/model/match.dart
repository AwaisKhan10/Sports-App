class Match {
  final int fixtureId;
  final int tournamentId;
  final int leagueId;
  final int homeTeamId;
  final int awayTeamId;
  final DateTime matchDate;
  final String venue;
  final String status;
  final int homeGoals;
  final int awayGoals;
  final DateTime createdAt;
  final String matchType;
  final String homeTeam;
  final String awayTeam;

  Match({
    required this.fixtureId,
    required this.tournamentId,
    required this.leagueId,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.matchDate,
    required this.venue,
    required this.status,
    required this.homeGoals,
    required this.awayGoals,
    required this.createdAt,
    required this.matchType,
    required this.homeTeam,
    required this.awayTeam,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      fixtureId: json['fixture_id'],
      tournamentId: json['tournament_id'],
      leagueId: json['league_id'],
      homeTeamId: json['home_team_id'],
      awayTeamId: json['away_team_id'],
      matchDate: DateTime.parse(json['match_date']),
      venue: json['venue'],
      status: json['status'],
      homeGoals: json['home_goals'],
      awayGoals: json['away_goals'],
      createdAt: DateTime.parse(json['created_at']),
      matchType: json['match_type'],
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fixture_id': fixtureId,
      'tournament_id': tournamentId,
      'league_id': leagueId,
      'home_team_id': homeTeamId,
      'away_team_id': awayTeamId,
      'match_date': matchDate.toIso8601String(),
      'venue': venue,
      'status': status,
      'home_goals': homeGoals,
      'away_goals': awayGoals,
      'created_at': createdAt.toIso8601String(),
      'match_type': matchType,
      'home_team': homeTeam,
      'away_team': awayTeam,
    };
  }

  String get score => '$homeGoals - $awayGoals';
  bool get isCompleted => status.toLowerCase() == 'completed';
  bool get isScheduled => status.toLowerCase() == 'scheduled';
}
