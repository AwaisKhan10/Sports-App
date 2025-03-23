class PurchaseTicketModel {
  final String date;
  final String month;
  final String day;
  final String team1;
  final String team2;
  final String time;
  final String venue;
  final String location;
  final String team1Logo;
  final String? team2Logo;

  PurchaseTicketModel({
    required this.date,
    required this.month,
    required this.day,
    required this.team1,
    required this.team2,
    required this.time,
    required this.venue,
    required this.location,
    required this.team1Logo,
    this.team2Logo,
  });
}
