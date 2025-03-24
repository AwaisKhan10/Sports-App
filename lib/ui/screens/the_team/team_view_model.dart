import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/team_payer.dart';
import 'package:sports_app/core/others/base_view_model.dart';

class TeamViewModel extends BaseViewModel {
  final List<TeamPlayerModel> _playersList = [
    TeamPlayerModel(
      name: "Francois Affolter",
      position: "Defender",
      number: "09",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Francois Affolter",
      position: "Midfielder",
      number: "10",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Alex Francois Affolter",
      position: "Forward",
      number: "07",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Alex Smith",
      position: "Forward",
      number: "07",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Francois Affolter",
      position: "Midfielder",
      number: "10",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Alex Francois Affolter",
      position: "Forward",
      number: "07",
      imageUrl: AppAssets().player,
    ),
    TeamPlayerModel(
      name: "Alex Smith",
      position: "Forward",
      number: "07",
      imageUrl: AppAssets().player,
    ),
  ];

  List<TeamPlayerModel> get playersList => _playersList;

  ///
  ///
  ///
  ///      player profile view model is also here
  ///
  ///
  ///
  List<String> playerProfileData = [];
}
