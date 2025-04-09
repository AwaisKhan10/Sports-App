import 'package:sports_app/core/constant/api_end_points.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/core/model/post.dart';
import 'package:sports_app/core/model/response/request_response.dart';
import 'package:sports_app/core/model/team_model.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/core/services/api_services.dart';

class DatabaseServices {
  final _apiService = ApiServices();

  /// Retrieve all posts with matches and extra details
  Future<RequestResponse<Map<String, dynamic>>> getAllPosts() async {
    try {
      final response = await _apiService.post(url: EndPoints.allPosts);

      if (response.success) {
        final data = response.data['data'];

        // Ensure the 'posts' and 'matches' data exist and map them properly
        return RequestResponse(
          true,
          data: {
            'posts':
                (data['posts'] as List?)?.map((post) {
                  return Post.fromJson(post);
                }).toList() ??
                [],
            'matches':
                (data['matches'] as List?)?.map((match) {
                  return Matches.fromJson(match);
                }).toList() ??
                [],
          },
        );
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Retrieve only match fixtures
  Future<RequestResponse<List<Matches>>> getMatches() async {
    try {
      final response = await _apiService.post(url: EndPoints.getMatches);

      if (response.success) {
        final matches =
            (response.data['data'] as List)
                .map((match) => Matches.fromJson(match))
                .toList();
        print("API Response: ${matches.toString()}");

        return RequestResponse(true, data: matches);
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Like a post
  Future<RequestResponse<String>> likePost({
    required String userId,
    required String postId,
  }) async {
    try {
      final response = await _apiService.post(
        url: EndPoints.likePost,
        data: {'user_id': userId, 'post_id': postId},
      );

      if (response.success) {
        final likeId = response.data['data']['like_id'].toString();
        return RequestResponse(true, data: likeId);
      } else {
        return RequestResponse(
          false,
          message: response.error ?? 'Error liking post',
        );
      }
    } catch (e) {
      return RequestResponse(false, message: 'Error: ${e.toString()}');
    }
  }

  Future<RequestResponse<String>> unLikePost({
    required String userId,
    required String postId,
  }) async {
    try {
      final response = await _apiService.post(
        url: EndPoints.unlikePost,
        data: {'user_id': userId, 'post_id': postId},
      );

      if (response.success) {
        // final likeId = response.data['data']['like_id'].toString();
        return RequestResponse(true, data: null);
      } else {
        return RequestResponse(
          false,
          message: response.error ?? 'Error unliking post',
        );
      }
    } catch (e) {
      return RequestResponse(false, message: 'Error: ${e.toString()}');
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
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Get teams using ApiServices.get
  Future<RequestResponse<List<TeamModel>>> getTeams() async {
    try {
      final response = await _apiService.get(url: EndPoints.getTeams);

      if (response.success) {
        final data = response.data;
        if (data['status'] == true) {
          List<dynamic> teamsJson = data['teams'];
          final teams =
              teamsJson
                  .map((teamJson) => TeamModel.fromJson(teamJson))
                  .toList();
          return RequestResponse(true, data: teams);
        } else {
          return RequestResponse(false, message: 'Failed to load teams');
        }
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Get team players using ApiServices.get
  Future<RequestResponse<List<TeamPlayerModel>>> getTeamPlayers(
    int teamId,
  ) async {
    try {
      final response = await _apiService.get(
        url: "${EndPoints.getTeamPlayers}&team_id=$teamId",
      );

      if (response.success) {
        final data = response.data;
        if (data['status'] == true) {
          List<dynamic> playersJson = data['players'];
          final players =
              playersJson
                  .map((playerJson) => TeamPlayerModel.fromJson(playerJson))
                  .toList();
          return RequestResponse(true, data: players);
        } else {
          return RequestResponse(
            false,
            message: data['message'] ?? 'Failed to load team players',
          );
        }
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Get team staff using ApiServices.get
  Future<RequestResponse<List<TeamStaffModel>>> getTeamStaff(int teamId) async {
    try {
      final response = await _apiService.get(
        url: "${EndPoints.getTeamStaff}&team_id=$teamId",
      );

      if (response.success) {
        final data = response.data;
        if (data['status'] == true) {
          List<dynamic> staffJson = data['staff'];
          final staff =
              staffJson
                  .map((staffJson) => TeamStaffModel.fromJson(staffJson))
                  .toList();
          return RequestResponse(true, data: staff);
        } else {
          return RequestResponse(
            false,
            message: data['message'] ?? 'Failed to load team staff',
          );
        }
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }
}
