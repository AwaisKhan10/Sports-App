import 'package:sports_app/core/model/team_model.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/core/model/response/request_response.dart';

class TeamViewModel extends BaseViewModel {
  final _db = locator<DatabaseServices>();
  List<TeamModel> _teams = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<TeamModel> get teams => _teams;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void fetchTeams() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Call the getTeams method and handle the RequestResponse
      RequestResponse<List<TeamModel>> response = await _db.getTeams();

      if (response.success) {
        _teams = response.data!; // Successfully fetched teams
      } else {
        _errorMessage = response.error ?? 'Failed to fetch teams';
      }
    } catch (e) {
      _errorMessage = e.toString(); // Handle any unexpected errors
    }

    _isLoading = false;
    notifyListeners();
  }
}
