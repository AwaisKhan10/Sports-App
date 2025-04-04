import 'package:sports_app/core/constant/api_end_points.dart';
import 'package:sports_app/core/model/comment.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/core/model/post.dart';
import 'package:sports_app/core/model/response/request_response.dart';
import 'package:sports_app/core/services/api_services.dart';

class DatabaseServices {
  final _apiService = ApiServices();

  /// Retrieve all posts with matches and extra details
  Future<RequestResponse<Map<String, dynamic>>> getAllPosts() async {
    try {
      final response = await _apiService.post(url: EndPoints.allPosts);

      if (response.success) {
        final data = response.data['data'];
        return RequestResponse(
          true,
          data: {
            'posts':
                (data['posts'] as List)
                    .map((post) => Post.fromJson(post))
                    .toList(),
            'matches':
                (data['matches'] as List)
                    .map((match) => Match.fromJson(match))
                    .toList(),
          },
        );
      } else {
        return RequestResponse(false, error: response.error);
      }
    } catch (e) {
      return RequestResponse(false, error: e.toString());
    }
  }

  /// Retrieve only match fixtures
  Future<RequestResponse<List<Match>>> getMatches() async {
    try {
      final response = await _apiService.post(url: EndPoints.getMatches);

      if (response.success) {
        final matches =
            (response.data['data'] as List)
                .map((match) => Match.fromJson(match))
                .toList();
        return RequestResponse(true, data: matches);
      } else {
        return RequestResponse(false, error: response.error);
      }
    } catch (e) {
      return RequestResponse(false, error: e.toString());
    }
  }

  /// Post a comment on a post
  Future<RequestResponse<String>> postComment({
    required String userId,
    required String postId,
    required String commentText,
  }) async {
    try {
      final response = await _apiService.post(
        url: EndPoints.commentPost,
        data: {
          'user_id': userId,
          'post_id': postId,
          'comment_text': commentText,
        },
      );

      if (response.success) {
        final commentId = response.data['data']['comment_id'].toString();
        return RequestResponse(true, data: commentId);
      } else {
        return RequestResponse(false, error: response.error);
      }
    } catch (e) {
      return RequestResponse(false, error: e.toString());
    }
  }
}
