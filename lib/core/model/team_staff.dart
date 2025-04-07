class TeamStaffModel {
  final int staffId;
  final String name;
  final String position;
  final String profileImage;

  TeamStaffModel({
    required this.staffId,
    required this.name,
    required this.position,
    required this.profileImage,
  });

  factory TeamStaffModel.fromJson(Map<String, dynamic> json) {
    return TeamStaffModel(
      staffId: json['staff_id'],
      name: json['name'],
      position: json['position'],
      profileImage: json['profile_image'],
    );
  }
}
