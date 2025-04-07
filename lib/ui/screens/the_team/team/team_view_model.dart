import 'package:sports_app/core/model/team_model.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/core/model/response/request_response.dart';

class TeamViewModel extends BaseViewModel {
  final _db = locator<DatabaseServices>();
  List<TeamModel> _teams = [];
  List<TeamPlayerModel> _players = [];
  List<TeamStaffModel> _staff = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<TeamModel> get teams => _teams;
  List<TeamPlayerModel> get players => _players;
  List<TeamStaffModel> get staff => _staff;
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
        _errorMessage = '';
      } else {
        _errorMessage = response.error ?? 'Failed to fetch teams';
      }
    } catch (e) {
      _errorMessage = e.toString(); // Handle any unexpected errors
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTeamPlayers(int teamId) async {
    _isLoading = true;
    notifyListeners();

    try {
      RequestResponse<List<TeamPlayerModel>> response = await _db
          .getTeamPlayers(teamId);

      if (response.success) {
        _players = response.data!;
        _errorMessage = '';
      } else {
        _errorMessage = response.error ?? 'Failed to fetch team players';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTeamStaff(int teamId) async {
    _isLoading = true;
    notifyListeners();

    try {
      RequestResponse<List<TeamStaffModel>> response = await _db.getTeamStaff(
        teamId,
      );

      if (response.success) {
        _staff = response.data!;
        _errorMessage = '';
      } else {
        _errorMessage = response.error ?? 'Failed to fetch team staff';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // Clear current team data
  void clearTeamData() {
    _players = [];
    _staff = [];
    notifyListeners();
  }
}
