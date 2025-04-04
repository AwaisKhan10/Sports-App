class AppUser {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? profileImage;
  final String? phone;

  AppUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.profileImage,
    this.phone,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      userId: json['user_id'].toString(),
      firstName: json['name'] ?? json['first_name'],
      lastName: json['lastname'] ?? json['last_name'],
      email: json['email'],
      profileImage: json['profile_image'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profile_image': profileImage,
      'phone': phone,
    };
  }
}
