import 'package:todo/data/models/todo.dart';
import 'package:todo/objectbox.g.dart';

class TodoObjectBox {
  late final Store _store;
  late final Box<Todo> _todoBox;

  TodoObjectBox._create(this._store) {
    _todoBox = Box<Todo>(_store);
  }

  static Future<TodoObjectBox> create() async {
    if (Store.isOpen('/data/data/com.example.todo/app_flutter/objectbox')) {
      // applicable when store is from other isolate
      final store = Store.attach(getObjectBoxModel(), '/data/data/com.example.todo/app_flutter/objectbox');
      return TodoObjectBox._create(store);
    }
    final store = await openStore();
    return TodoObjectBox._create(store);
  }

  Todo? getTodo({required int id}) {
    return _todoBox.get(id);
  }

  void createTodo({
    required String dateTime,
    required String date,
    required int reminderTime,
    required String status,
    required String title,
  }) {
    _todoBox.put(Todo(dateTime: dateTime, date: date, status: status, reminderTime: reminderTime, title: title));
  }

  String updateTodoStatus({required int id}) {
    final data = getTodo(id: id);
    _todoBox.put(Todo(dateTime: data!.dateTime, date: data.date, status: data.status == 'pending' ? 'done' : "pending", reminderTime: data.reminderTime, title: data.title, id: id));
    return data.date;
  }

  Todo? deleteTodo({required int id}) {
    return _todoBox.get(id);
  }

  List<Todo> getTodos() {
    final query = _todoBox.query().build();
    return query.find();
  }

  Todo? getOverlayTodo() {
    final query = _todoBox.query(Todo_.isOverlayNow.equals(true)).build();
    return query.findFirst();
  }

  void updateOverlayTodo({required Todo data}) {
    _todoBox.put(Todo(dateTime: data.dateTime, date: data.date, status: data.status, reminderTime: data.reminderTime, title: data.title, id: data.id, isAlarm: false));
  }

  Todo? getNotifyTodoNow() {
    final allTodos = getTodos();
    for (final element in allTodos) {
      {
        final dateToday = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );
        final alrtDate = DateTime(
          DateTime.parse(element.date).year,
          DateTime.parse(element.date).month,
          DateTime.parse(element.date).day,
        );
        if (alrtDate == dateToday && element.isAlarm == true) {
          final alartTime = DateTime(
            DateTime.parse(element.dateTime).year,
            DateTime.parse(element.dateTime).month,
            DateTime.parse(element.dateTime).day,
            DateTime.parse(element.dateTime).hour,
            DateTime.parse(element.dateTime).minute,
          );
          final timeNow = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, DateTime.now().minute + element.reminderTime);
          if (alartTime == timeNow) {
            final data = getTodo(id: element.id);
            _todoBox.put(Todo(dateTime: data!.dateTime, date: data.date, status: data.status, reminderTime: data.reminderTime, title: data.title, id: element.id, isAlarm: false, isOverlayNow: true));
            return element;
          }
        }
      }
    }
    return null;
  }

  List<Todo> getTodosByDate({required String date}) {
    final query = _todoBox.query(Todo_.date.equals(date).and(Todo_.status.equals('pending'))).build();
    return query.find();
  }

  List<Todo> getCompletedTodosByDate({required DateTime date}) {
    final query = _todoBox.query().build();
    return query.find();
  }

  List<Todo> getCompletedTodos({required String date}) {
    final query = _todoBox.query(Todo_.date.equals(date).and(Todo_.status.equals('done'))).build();
    return query.find();
  }
}
