import 'package:todo/data/models/todo.dart';
import 'package:todo/objectbox.g.dart';

class TodoObjectBox {
  late final Store _store;
  late final Box<Todo> _todoBox;

  TodoObjectBox._create(this._store) {
    _todoBox = Box<Todo>(_store);
  }

  static Future<TodoObjectBox> create() async {
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
