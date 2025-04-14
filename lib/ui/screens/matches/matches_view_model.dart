import 'package:flutter/material.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/model/match.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';

class MatchesViewModel extends BaseViewModel {
  final _databaseService = locator<DatabaseServices>();

  String? _error;
  List<Matches> _matches = [];

  String? get error => _error;
  List<Matches> get matches => _matches;

  Future<void> loadMatches() async {
    setState(ViewState.busy);

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
      setState(ViewState.idle);
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
