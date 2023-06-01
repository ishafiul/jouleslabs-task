import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/main.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListInitial());

  Future<void> getTodos({required DateTime date}) async {
    emit(TodoListLoading());
    final pendingTodo = objectBox.getTodosByDate(date: date.toIso8601String());
    final completedTodo = objectBox.getCompletedTodos(date: date.toIso8601String());
    emit(TodoListLoaded(pendingTodo: pendingTodo, completedTodo: completedTodo));
  }

  Future<void> markAsDone({required int id}) async {
    final date = objectBox.updateTodoStatus(id: id);
    getTodos(date: DateTime.parse(date));
  }

  Future<void> createTodos({
    required DateTime date,
    required String title,
    required TimeOfDay time,
    required String reminderMin,
  }) async {
    final dateTime = DateTime.utc(date.year, date.month, date.day, time.hour, time.minute);
    objectBox.createTodo(dateTime: dateTime.toIso8601String(), date: date.toIso8601String(), reminderTime: int.parse(reminderMin), status: "pending", title: title);
    getTodos(date: date);
  }
}
