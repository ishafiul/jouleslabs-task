import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/widgets/bottom_sheet.dart';
import 'package:todo/comon/widgets/layout/layout.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/data/states/todo_list/todo_list_cubit.dart';
import 'package:todo/ui/todo/widgets/callender.dart';
import 'package:todo/ui/todo/widgets/complited_todo_list.dart';
import 'package:todo/ui/todo/widgets/create_bottomsheet.dart';
import 'package:todo/ui/todo/widgets/pending_todo_list.dart';

class TodoScreen extends HookWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
         context.read<TodoListCubit>().getTodos(date: DateTime.utc(2023, 6, 1));
        return null;
      },
      [],
    );
    return Layout(
      appBar: LayoutAppBar(
        appBarTitle: const Text('To Do'),
        leading: AppbarLeading(
          onTap: () {
            context.go('/home');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () async {
          ArtistaBottomSheet(context: context, child: const TodoCreateBottomSheet());
        },
        backgroundColor: ArtistaColor.secondary,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Space.xl),
          child: Column(
            children: [
              TodoCalender(
                onChange: (DateTime date) {
                  final todoListCubit = context.read<TodoListCubit>();
                  todoListCubit.getTodos(date: date);
                },
              ),
              SizedBox(
                height: 32,
              ),
              CompletedTodoList(),
              SizedBox(
                height: 32,
              ),
              PendingTodoList(),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
