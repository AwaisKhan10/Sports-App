import 'package:flutter/material.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/core/services/database_services.dart';

class ScheduleViewModel extends ChangeNotifier {
  final _databaseService = DatabaseServices();

  bool _isLoading = false;
  String? _error;
  List<Match> _matches = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Match> get matches => _matches;

  Future<void> loadMatches() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _databaseService.getMatches();
      if (result.success) {
        _matches = result.data ?? [];
      } else {
        _error = result.error ?? 'Failed to load matches';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
