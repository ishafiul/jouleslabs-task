part of 'todo_list_cubit.dart';

@immutable
abstract class TodoListState {}

class TodoListInitial extends TodoListState {}
class TodoListLoading extends TodoListState {}
class TodoListLoaded extends TodoListState {}
