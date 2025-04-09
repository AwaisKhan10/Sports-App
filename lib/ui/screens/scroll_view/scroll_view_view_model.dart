// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'package:sports_app/core/model/comment.dart';
import 'package:sports_app/core/model/like.dart';
import 'package:sports_app/core/model/post.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/core/services/local_storage.dart';

class ScrollViewViewModel extends BaseViewModel {
  final _databaseService = DatabaseServices();
  final _localStorageService = LocalStorageService();

  bool _isLoading = false;
  String? _error;
  List<Post> _posts = [];
  Map<String, bool> _isPostingComment = {};
  Map<String, bool> isLike = {}; // Track like status

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Post> get posts => _posts;
  bool isPostingCommentFor(String postId) => _isPostingComment[postId] ?? false;
  bool isLiked(String postId) =>
      isLike[postId] ?? false; // Check if post is liked

  Future<void> loadPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _databaseService.getAllPosts();
      if (result.success && result.data != null) {
        _posts = (result.data!['posts'] as List<Post>);
        // Initialize like status for each post
        isLike = {
          for (var post in _posts)
            post.id:
                (post.likes.any(
                  (like) => like.userId == _localStorageService.userId,
                )) ??
                false,
        };
      } else {
        _error = result.message ?? 'Failed to load posts';
        log(_error.toString());
      }
    } catch (e) {
      _error = e.toString();
      log(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Post Comment Functionality
  Future<void> postComment({
    required String postId,
    required String commentText,
  }) async {
    final userId = _localStorageService.userId;
    if (userId == null) {
      _error = 'Please login to comment';
      notifyListeners();
      return;
    }

    _isPostingComment[postId] = true;
    _posts
        .where((posti) => posti.id == postId)
        .first
        .comments
        .add(
          Comment(
            userId: userId,
            commentText: commentText,
            userName: _localStorageService.user?.firstName ?? '',
          ),
        );

    notifyListeners();

    try {
      final result = await _databaseService.postComment(
        userId: userId,
        postId: postId,
        commentText: commentText,
      );

      if (result.success) {
        // Reload posts to show new comment
        // await loadPosts();
      } else {
        _error = result.message ?? 'Failed to post comment';
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _isPostingComment[postId] = false;
      notifyListeners();
    }
  }

  // Toggle Like Functionality
  Future<void> toggleLike({required Post post}) async {
    final postId = post.id;
    final userId = _localStorageService.userId;
    if (userId == null) {
      _error = 'Please login to like posts';
      notifyListeners();
      return;
    }

    final isLiked = post.likes.any((like) => like.userId == userId);

    // Toggle like status
    isLike[postId] = !isLike[postId]!; // Toggle the like state

    // Update UI (notify listeners)
    notifyListeners();

    try {
      if (!isLiked) {
        _posts
            .where((posti) => posti == post)
            .first
            .likes
            .add(
              Likes(
                userId: userId,
                postId: postId,
                userName: _localStorageService.user?.firstName ?? '',
              ),
            );

        _posts.where((posti) => posti == post).first.totalLikes += 1;
        notifyListeners();
        final result = await _databaseService.likePost(
          userId: userId,
          postId: postId,
        );

        if (result.success) {
          // Optionally reload posts to show updated like count if necessary
          // await loadPosts();
        } else {
          _error = result.message ?? 'Failed to like the post';
          notifyListeners();
        }
      } else {
        _posts
            .where((posti) => posti == post)
            .first
            .likes
            .removeWhere((like) => like.userId == userId);

        _posts.where((posti) => posti == post).first.totalLikes -= 1;
        notifyListeners();
        //unlike
        final result = await _databaseService.unLikePost(
          userId: userId,
          postId: postId,
        );

        if (result.success) {
          // Optionally reload posts to show updated like count if necessary
          // await loadPosts();
        } else {
          _error = result.message ?? 'Failed to like the post';
          notifyListeners();
        }
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
