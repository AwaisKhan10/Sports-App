class TweetModel {
  final String username;
  final String handle;
  final String timeAgo;
  final String content;
  final String? imageUrl;
  final String? link;

  TweetModel({
    required this.username,
    required this.handle,
    required this.timeAgo,
    required this.content,
    this.imageUrl,
    this.link,
  });
}
