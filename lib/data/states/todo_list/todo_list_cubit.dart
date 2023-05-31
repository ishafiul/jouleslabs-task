import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/main.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListInitial());

  Future<void> getTodos({required DateTime date}) async {
    objectBox.getCompletedTodos(date: date.toIso8601String());
  }
}
