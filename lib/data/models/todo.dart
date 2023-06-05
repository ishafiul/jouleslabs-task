import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id(assignable: true)
  int id;
  String? description;
  String title;
  String status;
  String dateTime;
  bool? isAlarm;
  bool? isOverlayNow;
  String date;
  int reminderTime;

  Todo({
    this.id = 0,
    this.isAlarm = true,
    this.isOverlayNow = false,
    this.description,
    required this.dateTime,
    required this.date,
    required this.status,
    required this.reminderTime,
    required this.title,
  });
}
