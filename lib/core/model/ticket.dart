class TicketScreenModel {
  final String imageUrl;
  final String title;
  final String? subTitle;
  TicketScreenModel({
    required this.imageUrl,
    required this.title,
    this.subTitle,
  });
}
