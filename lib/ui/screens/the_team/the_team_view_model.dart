import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/model/team_player.dart';
import 'package:sports_app/core/model/team_staff.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/locator.dart';

class TheTeamViewModel extends BaseViewModel {
  final _db = locator<DatabaseServices>();
  List<TeamPlayerModel> _playersList = [];
  List<TeamStaffModel> _staffList = [];
  String _errorMessage = '';

  List<TeamPlayerModel> get playersList => _playersList;
  List<TeamStaffModel> get staffList => _staffList;
  String get errorMessage => _errorMessage;

  Future<void> fetchTeamPlayers(int teamId) async {
    setState(ViewState.busy); // Set the state to busy before starting the fetch
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

    setState(ViewState.idle);
    notifyListeners();
  }

  Future<void> fetchStaffMembers(int teamId) async {
    setState(ViewState.busy);
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

    setState(ViewState.idle);
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
