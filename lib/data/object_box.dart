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

  Todo? createTodo({required int id}) {
    return _todoBox.get(id);
  }

  Todo? updateTodo({required int id}) {
    return _todoBox.get(id);
  }

  Todo? deleteTodo({required int id}) {
    return _todoBox.get(id);
  }

  List<Todo> getTodos() {
    final query = _todoBox.query().build();
    return query.find();
  }

  List<Todo> getTodosByDate({required DateTime date}) {
    final query = _todoBox.query().build();
    return query.find();
  }

  List<Todo> getCompletedTodosByDate({required DateTime date}) {
    final query = _todoBox.query().build();
    return query.find();
  }

  List<Todo> getCompletedTodos({required String date}) {
    final query = _todoBox.query(Todo_.dateTime.equals(date).and(Todo_.status.equals('done'))).build();
    return query.find();
  }
}
