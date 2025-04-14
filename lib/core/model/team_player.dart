class TeamPlayerModel {
  final int? playerId;
  final int? teamId;
  final String? name;
  final String? profileImage;
  final String? position;
  final String? dob;
  final String? gender;
  final String? number;
  final String? height;
  final String? weight;
  final String? minutesPlayed;
  final String? gamesPlayed;
  final String? birthPlace;
  final String? shots;
  final String? onGoal;
  final String? goals;
  final String? assists;

  TeamPlayerModel({
    this.playerId,
    this.teamId,
    this.name,
    this.profileImage,
    this.position,
    this.dob,
    this.gender,
    this.number,
    this.height,
    this.weight,
    this.minutesPlayed,
    this.gamesPlayed,
    this.birthPlace,
    this.shots,
    this.onGoal,
    this.goals,
    this.assists,
  });

  factory TeamPlayerModel.fromJson(Map<String, dynamic> json) {
    return TeamPlayerModel(
      playerId: json['player_id'],
      teamId: json['team_id'],
      name: json['name'],
      profileImage: json['profile_image'],
      position: json['position'],
      dob: json['dob'],
      gender: json['gender'],
      number: json['shirt_number'],
      height: json['height'],
      weight: json['weight'],
      minutesPlayed: json['minutes_played'],
      gamesPlayed: json['games_played'],
      birthPlace: json['birth_place'],
      shots: json['shots'],
      onGoal: json['on_goal'],
      goals: json['goals'],
      assists: json['assists'],
    );
  }
}
