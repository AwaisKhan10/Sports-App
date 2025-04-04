import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sports_app/core/model/post.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/core/services/local_storage.dart';

class ScrollViewViewModel extends ChangeNotifier {
  final _databaseService = DatabaseServices();
  final _localStorageService = LocalStorageService();

  bool _isLoading = false;
  String? _error;
  List<Post> _posts = [];
  Map<String, bool> _isPostingComment = {};

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Post> get posts => _posts;
  bool isPostingCommentFor(String postId) => _isPostingComment[postId] ?? false;

  Future<void> loadPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _databaseService.getAllPosts();
      if (result.success && result.data != null) {
        _posts = (result.data!['posts'] as List<Post>);
        // .map((post) => Post.fromJson(post))
        // .toList();
      } else {
        _error = result.error ?? 'Failed to load posts';
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
    notifyListeners();

    try {
      final result = await _databaseService.postComment(
        userId: userId,
        postId: postId,
        commentText: commentText,
      );

      if (result.success) {
        // Reload posts to show new comment
        await loadPosts();
      } else {
        _error = result.error ?? 'Failed to post comment';
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

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
