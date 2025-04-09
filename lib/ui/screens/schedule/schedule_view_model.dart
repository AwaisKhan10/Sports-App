import 'package:flutter/material.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';

class ScheduleViewModel extends ChangeNotifier {
  final _databaseService = locator<DatabaseServices>();

  bool _isLoading = false;
  String? _error;
  List<Matches> _matches = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Matches> get matches => _matches;

  Future<void> loadMatches() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _databaseService.getMatches();
      print(
        result.data,
      ); // Add this line to see what data is returned from the API.
      if (result.success) {
        _matches = (result.data!);
      } else {
        _error = result.message ?? 'Failed to load matches';
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
