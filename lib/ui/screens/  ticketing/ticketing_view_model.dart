import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/model/ticket.dart';
import 'package:sports_app/core/others/base_view_model.dart';

class TicketingViewModel extends BaseViewModel {
  List<TicketScreenModel> tickets = [
    TicketScreenModel(
      imageUrl: AppAssets().schedule,
      title: 'Purchase',
      subTitle: 'Tickets',
    ),
    TicketScreenModel(
      imageUrl: AppAssets().schedule,
      title: 'My',
      subTitle: 'Tickets',
    ),
    TicketScreenModel(
      imageUrl: AppAssets().schedule,
      title: 'Purchase',
      subTitle: 'Tickets',
    ),
    TicketScreenModel(
      imageUrl: AppAssets().schedule,
      title: 'Purchase',
      subTitle: 'Tickets',
    ),
  ];

  ///
  ///      stadium information view model is also here
  ///
}
