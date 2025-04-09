class Likes {
  final String userId;
  final String postId;
  final String userName;

  Likes({required this.userId, required this.postId, required this.userName});

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
      userId: json['user_id'].toString(),
      postId: json['post_id'].toString(),
      userName: json['user_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'post_id': postId, 'user_name': userName};
  }
}
