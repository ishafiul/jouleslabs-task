import 'package:objectbox/objectbox.dart';

@Entity()
class Todo {
  @Id()
  int id;
  String? description;
  String title;
  String status;
  String dateTime;
  int reminderTime;

  Todo({
    this.id = 0,
    this.description,
    required this.dateTime,
    required this.status,
    required this.reminderTime,
    required this.title,
  });
}
