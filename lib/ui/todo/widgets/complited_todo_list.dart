import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/data/states/todo_list/todo_list_cubit.dart';

class CompletedTodoList extends StatelessWidget {
  const CompletedTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        if (state is TodoListLoaded) {
          if (state.completedTodo.isEmpty) {
            return const SizedBox();
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed (${state.completedTodo.length})',
                    style: context.textTheme.titleLarge,
                  ),
                  const Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                children: List.generate(
                  state.completedTodo.length,
                  (index) => CheckboxListTile(
                    value: true,
                    onChanged: (value) {
                      context.read<TodoListCubit>().markAsDone(id: state.completedTodo[index].id);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(state.completedTodo[index].title, style: context.textTheme.bodyLarge?.copyWith(decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold)),
                    tileColor: const Color(0xFFFFF6E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    secondary: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ),
                ).withSpaceBetween(height: 16),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
