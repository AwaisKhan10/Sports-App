class NotificationModel {
  final String imageUrl;
  final String title;
  final String day;
  final String month;
  final int date;
  final int year;
  final String description;

  NotificationModel({
    required this.imageUrl,
    required this.title,
    required this.day,
    required this.month,
    required this.date,
    required this.year,
    required this.description,
  });

  String get fullDate => "$day, $month $date, $year"; // Formatted date string
}
