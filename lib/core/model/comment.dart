class Comment {
  final String userId;
  final String commentText;
  final String userName;

  Comment({
    required this.userId,
    required this.commentText,
    required this.userName,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['user_id'].toString(),
      commentText: json['comment'],
      userName: json['user_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'comment': commentText, 'user_name': userName};
  }
}
