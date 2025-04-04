import 'package:sports_app/core/model/comment.dart';

class Post {
  final int id;
  final String? postImg;
  final String postText;
  final String? videoUrl;
  final DateTime createdAt;
  final String teamName;
  final List<Comment> comments;
  final int totalLikes;

  Post({
    required this.id,
    this.postImg,
    required this.postText,
    this.videoUrl,
    required this.createdAt,
    required this.teamName,
    required this.comments,
    required this.totalLikes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      postImg: json['post_img'],
      postText: json['post_text'],
      videoUrl: json['video_url'],
      createdAt: DateTime.parse(json['created_at']),
      teamName: json['team_name'],
      comments:
          (json['comments'] as List?)
              ?.map((comment) => Comment.fromJson(comment))
              .toList() ??
          [],
      totalLikes: json['total_likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post_img': postImg,
      'post_text': postText,
      'video_url': videoUrl,
      'created_at': createdAt.toIso8601String(),
      'team_name': teamName,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'total_likes': totalLikes,
    };
  }
}
