import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';

class TheTeamViewModel extends BaseViewModel {
  final _db = locator<DatabaseServices>();
  List<TeamPlayerModel> _playersList = [];
  List<TeamStaffModel> _staffList = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<TeamPlayerModel> get playersList => _playersList;
  List<TeamStaffModel> get staffList => _staffList;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchTeamPlayers(int teamId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _db.getTeamPlayers(teamId);
      if (response.success) {
        _playersList = response.data!;
        _errorMessage = '';
      } else {
        _errorMessage = response.message ?? 'Failed to fetch team players';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchStaffMembers(int teamId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _db.getTeamStaff(teamId);
      if (response.success) {
        _staffList = response.data!;
        _errorMessage = '';
      } else {
        _errorMessage = response.message ?? 'Failed to fetch Staff Members';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  ///
  ///
  ///
  ///      player profile view model is also here
  ///
  ///
  ///
  List<String> playerProfileData = [];
}
